From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] staging: mt7621-mmc: MIPS: ralink: add sdhci for
 mt7620a SoC
Date: Thu, 5 Apr 2018 14:56:54 +0300
Message-ID: <20180405115654.GA6324@mwanda>
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

Hello John Crispin,

The patch 8b634a9c7620: "staging: mt7621-mmc: MIPS: ralink: add sdhci
for mt7620a SoC" from Mar 15, 2018, leads to the following static
checker warning:

	drivers/staging/mt7621-mmc/sd.c:2790 msdc_drv_probe()
	warn: curly braces intended?

drivers/staging/mt7621-mmc/sd.c
  2777      /* For sd card: MSDC_SYS_SUSPEND | MSDC_WP_PIN_EN | MSDC_CD_PIN_EN | MSDC_REMOVABLE | MSDC_HIGHSPEED, 
  2778         For sdio   : MSDC_EXT_SDIO_IRQ | MSDC_HIGHSPEED */
  2779      if (hw->flags & MSDC_HIGHSPEED) {
  2780          mmc->caps   = MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED;
  2781      }
  2782      if (hw->data_pins == 4) { /* current data_pins are all 4*/
  2783          mmc->caps  |= MMC_CAP_4_BIT_DATA;
  2784      } else if (hw->data_pins == 8) {
  2785          mmc->caps  |= MMC_CAP_8_BIT_DATA;
  2786      }
  2787      if ((hw->flags & MSDC_SDIO_IRQ) || (hw->flags & MSDC_EXT_SDIO_IRQ))

Are curly braces intended for this if statement?

  2788          mmc->caps |= MMC_CAP_SDIO_IRQ;  /* yes for sdio */
  2789  
  2790          cd_active_low = !of_property_read_bool(pdev->dev.of_node, "mediatek,cd-high");
  2791          mtk_sw_poll = of_property_read_bool(pdev->dev.of_node, "mediatek,cd-poll");
  2792  
  2793          if (mtk_sw_poll)
  2794                  mmc->caps |= MMC_CAP_NEEDS_POLL;

because the indenting seems to say that the braces should reach up to
here.

  2795  
  2796      /* MMC core transfer sizes tunable parameters */
  2797  #if LINUX_VERSION_CODE > KERNEL_VERSION(3,10,0)
  2798      mmc->max_segs      = MAX_HW_SGMTS;
  2799  #else
  2800      mmc->max_hw_segs   = MAX_HW_SGMTS;
  2801      mmc->max_phys_segs = MAX_PHY_SGMTS;
  2802  #endif


regards,
dan carpenter
