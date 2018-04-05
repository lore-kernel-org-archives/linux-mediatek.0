From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] staging: mt7621-mmc: MIPS: ralink: add sdhci for
 mt7620a SoC
Date: Thu, 5 Apr 2018 15:13:10 +0300
Message-ID: <20180405121310.GA7782@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: blogic@openwrt.org
Cc: devel@driverdev.osuosl.org, NeilBrown <neil@brown.name>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

[ I just decided to forward you guys all the Smatch warnings.  -dan ]

Hello John Crispin,

The patch 8b634a9c7620: "staging: mt7621-mmc: MIPS: ralink: add sdhci
for mt7620a SoC" from Mar 15, 2018, leads to the following static
checker warning:

	drivers/staging/mt7621-mmc/sd.c:951 msdc_command_start()
	warn: we tested 'opcode == 3' before and it was 'false'

drivers/staging/mt7621-mmc/sd.c
   931  static unsigned int msdc_command_start(struct msdc_host   *host, 
   932                                        struct mmc_command *cmd,
   933                                        int                 tune,   /* not used */
   934                                        unsigned long       timeout)
   935  {
   936      u32 base = host->base;
   937      u32 opcode = cmd->opcode;
   938      u32 rawcmd;
   939      u32 wints = MSDC_INT_CMDRDY  | MSDC_INT_RSPCRCERR  | MSDC_INT_CMDTMO  |  
   940                  MSDC_INT_ACMDRDY | MSDC_INT_ACMDCRCERR | MSDC_INT_ACMDTMO | 
   941                  MSDC_INT_ACMD19_DONE;  
   942                     
   943      u32 resp;  
   944      unsigned long tmo;
   945  
   946      /* Protocol layer does not provide response type, but our hardware needs 
   947       * to know exact type, not just size!
   948       */
   949      if (opcode == MMC_SEND_OP_COND || opcode == SD_APP_OP_COND)
   950          resp = RESP_R3;
   951      else if (opcode == MMC_SET_RELATIVE_ADDR || opcode == SD_SEND_RELATIVE_ADDR)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
MMC_SET_RELATIVE_ADDR and SD_SEND_RELATIVE_ADDR are both 3 so this
is redundant.

   952          resp = (mmc_cmd_type(cmd) == MMC_CMD_BCR) ? RESP_R6 : RESP_R1;
   953      else if (opcode == MMC_FAST_IO)
   954          resp = RESP_R4;
   955      else if (opcode == MMC_GO_IRQ_STATE)
   956          resp = RESP_R5;
   957      else if (opcode == MMC_SELECT_CARD)
   958          resp = (cmd->arg != 0) ? RESP_R1B : RESP_NONE;
   959      else if (opcode == SD_IO_RW_DIRECT || opcode == SD_IO_RW_EXTENDED)
   960          resp = RESP_R1; /* SDIO workaround. */
   961      else if (opcode == SD_SEND_IF_COND && (mmc_cmd_type(cmd) == MMC_CMD_BCR))
   962          resp = RESP_R1;
   963      else {
   964          switch (mmc_resp_type(cmd)) {

        drivers/staging/mt7621-mmc/sd.c:2961 msdc_drv_suspend()
        warn: variable dereferenced before check 'mmc' (see line 2959)

        drivers/staging/mt7621-mmc/sd.c:2976 msdc_drv_resume()
        warn: variable dereferenced before check 'mmc' (see line 2972)

drivers/staging/mt7621-mmc/sd.c
  2953  /* Fix me: Power Flow */
  2954  #ifdef CONFIG_PM
  2955  static int msdc_drv_suspend(struct platform_device *pdev, pm_message_t state)
  2956  {
  2957      int ret = 0;
  2958      struct mmc_host *mmc = platform_get_drvdata(pdev);
  2959      struct msdc_host *host = mmc_priv(mmc);
                                     ^^^^^^^^^^^^^
Dereference

  2960  
  2961      if (mmc && state.event == PM_EVENT_SUSPEND && (host->hw->flags & MSDC_SYS_SUSPEND)) { /* will set for card */
                ^^^
Check

  2962          msdc_pm(state, (void*)host);
  2963      }
  2964      
  2965      return ret;
  2966  }
  2967
  2968  static int msdc_drv_resume(struct platform_device *pdev)
  2969  {
  2970      int ret = 0;
  2971      struct mmc_host *mmc = platform_get_drvdata(pdev);
  2972      struct msdc_host *host = mmc_priv(mmc);
                                     ^^^^^^^^^^^^
Dereference

  2973      struct pm_message state;
  2974  
  2975      state.event = PM_EVENT_RESUME;
  2976      if (mmc && (host->hw->flags & MSDC_SYS_SUSPEND)) {/* will set for card */
                ^^^
Check

  2977          msdc_pm(state, (void*)host);
  2978      }
  2979  
  2980      /* This mean WIFI not controller by PM */
  2981      
  2982      return ret;
  2983  }

        drivers/staging/mt7621-mmc/dbg.c:270 msdc_debug_proc_write()
        warn: copy_to/from_user() returns a positive value

drivers/staging/mt7621-mmc/dbg.c
   257  static ssize_t msdc_debug_proc_write(struct file *file, 
   258                          const char __user *buf, size_t count, loff_t *data)
   259  {
   260          int ret;
   261          
   262          int cmd, p1, p2;   
   263          int id, zone;
   264          int mode, size;  
   265    
   266          if (count == 0)return -1;
   267          if(count > 255)count = 255;
   268  
   269          ret = copy_from_user(cmd_buf, buf, count);
   270          if (ret < 0)return -1;

This should be:

		if (copy_from_user(cmd_buf, buf, count))
			return -EFAULT;

   271          
   272          cmd_buf[count] = '\0';
   273          printk("msdc Write %s\n", cmd_buf);
   274  

        drivers/staging/mt7621-mmc/dbg.c:339 msdc_debug_proc_init()
        warn: proc file '"msdc_debug"' is world writable

	drivers/staging/mt7621-mmc/dbg.c:341 msdc_debug_proc_init()
	warn: 'de' isn't an ERR_PTR


drivers/staging/mt7621-mmc/dbg.c
   337  int msdc_debug_proc_init(void) 
   338  {       
   339      struct proc_dir_entry *de = proc_create("msdc_debug", 0667, NULL, &msdc_debug_fops);
                                                                     ^
This should probably be a zero instead of a seven.

   340  
   341      if (!de || IS_ERR(de))
                       ^^^^^^^^^^
Remove this.

   342          printk("!! Create MSDC debug PROC fail !!\n");
   343      
   344      return 0 ;
   345  }

regards,
dan carpenter
