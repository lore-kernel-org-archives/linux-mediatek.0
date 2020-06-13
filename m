Return-Path: <SRS0=c1Td=72=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA049C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 14:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC84720792
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 14:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Blj4nKOg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g0wX4/9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC84720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlsILd3yDf7wbwAsYfMBlOxL0F6C3sLfJR++J5+5dXk=; b=Blj4nKOgiZkurY
	4RGkSAddMYnMbx8zMF8hAjuQavhfTmchJPwL96PnP14z1OMLrAeN/24b1SBIHNO3d1LHUOX0QuQqP
	MZYKeLnqyeI0oAgGmCtPkcdXAYz4rEf2YhlfCA860M0wmf6foIUF4XdJGwumDXIlfSJTi5Ur3XL6/
	i7hlHRjzHIHiBmIfvNznNiqRdYKLCWqt01SRWoE1BpKFuKfUnOapUuqdQsZGAK/kOezV6ZVI+HcjI
	y0tki6A1dgd/4pmuBa6KsWYiLrzUhGCo2NK3LMiFJ6RTmKfGGutT+NkhatZLVfWjPDOtWlPXTlMyV
	bdWWDxkxMZ45+NYpnOcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jk79v-0003pj-3b; Sat, 13 Jun 2020 14:29:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jk79P-0003gZ-PW; Sat, 13 Jun 2020 14:29:07 +0000
X-UUID: 1d2edd2c01dd4e55ab050ccb91f9f1a0-20200613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wHRgb/U6EDepiWXV4OCkOGKqYbDMEPUS8ORL4G6vBio=; 
 b=g0wX4/9zL38TPFHqu9k31wM43At4ZGQ1sAE29H2OQq+SkpZtpvONOTHitoafQpBvRb+qjtkqsck3SYOfRDisSI5IaC5VCulTGWjJ1Kt+DLhEiuSAvmJnKFPQvxo3G6uEsbAy0OB+IVhK5hpEeObXCP9GR9Kx+lm3JjVjPH9bRHY=;
X-UUID: 1d2edd2c01dd4e55ab050ccb91f9f1a0-20200613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 768726714; Sat, 13 Jun 2020 06:28:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Jun 2020 07:18:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Jun 2020 22:18:27 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Jun 2020 22:18:28 +0800
Message-ID: <1592057910.25636.81.camel@mtkswgap22>
Subject: RE: [PATCH v1 2/2] scsi: ufs: Add trace event for UIC commands
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Sat, 13 Jun 2020 22:18:30 +0800
In-Reply-To: <SN6PR04MB4640968DCD865651AFA8925DFC9E0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200612151000.27639-1-stanley.chu@mediatek.com>
 <20200612151000.27639-3-stanley.chu@mediatek.com>
 <SN6PR04MB4640968DCD865651AFA8925DFC9E0@SN6PR04MB4640.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C5756CE2E349CF9053AF970775DB6925B7A04576EC619A0BCFF76E5D910C78282000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_072900_125839_31EC7D0D 
X-CRM114-Status: GOOD (  19.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sat, 2020-06-13 at 10:48 +0000, Avri Altman wrote:
> > +static void ufshcd_add_uic_command_trace(struct ufs_hba *hba,
> > +                                        struct uic_command *ucmd,
> > +                                        const char *str)
> > +{
> > +       u32 cmd;
> > +
> > +       if (!trace_ufshcd_uic_command_enabled())
> > +               return;
> > +
> > +       if (!strcmp(str, "uic_send"))
> > +               cmd = ucmd->command;
> > +       else
> > +               cmd = ufshcd_readl(hba, REG_UIC_COMMAND);
> Why on complete you can't just use ucmd->command as well?

Reading registers is really helpful for debugging to check if host UIC
command register really received the command before.

But the original requesting UIC command shall be logged in trace so
ucmd->command is logged during "send", and the command in register is
read and logged during "completed". Then we could simply check them to
know if something wrong while sending the command.

This concept is similar as current UTP command trace events that
doorbell register is read and dumped in the trace.

> 
> > +
> > +       trace_ufshcd_uic_command(dev_name(hba->dev), str, cmd,
> > +                                ucmd->result,
> > +                                ufshcd_readl(hba, REG_UIC_COMMAND_ARG_1),
> > +                                ufshcd_readl(hba, REG_UIC_COMMAND_ARG_2),
> > +                                ufshcd_readl(hba, REG_UIC_COMMAND_ARG_3));
> Why can't you just use the ucmd members?
> Why need to read those?

As above same reason, reading registers can know which arguments are
exactly sent to the device.

This is very helpful for fast issue breakdown if UIC command is not
responded under expectation.

Here, we also really want to keep the original requesting arguments from
"ucmd", just like UIC command. However, arguments in register will be
changed after UIC command is done so we can not do the same way as UIC
command. So a compromise is here that we logged the arguments which host
register exactly received in trace.

> 
> > +}
> 
> 
> > +
> >  static void ufshcd_add_command_trace(struct ufs_hba *hba,
> >                 unsigned int tag, const char *str)
> >  {
> > @@ -2054,6 +2075,8 @@ ufshcd_dispatch_uic_cmd(struct ufs_hba *hba,
> > struct uic_command *uic_cmd)
> >         /* Write UIC Cmd */
> >         ufshcd_writel(hba, uic_cmd->command & COMMAND_OPCODE_MASK,
> >                       REG_UIC_COMMAND);
> > +
> > +       ufshcd_add_uic_command_trace(hba, uic_cmd, "uic_send");
> >  }
> > 
> >  /**
> > @@ -2080,6 +2103,9 @@ ufshcd_wait_for_uic_cmd(struct ufs_hba *hba,
> > struct uic_command *uic_cmd)
> >         hba->active_uic_cmd = NULL;
> >         spin_unlock_irqrestore(hba->host->host_lock, flags);
> > 
> > +       uic_cmd->result = ret;
> > +       ufshcd_add_uic_command_trace(hba, uic_cmd, "uic_complete");
> > +
> >         return ret;
> >  }
> Can't you just call the "send" and "complete" from ufshcd_send_uic_cmd?

For "send", we would like to log the time as precise as possible so
"send" event is logged while UIC command is sent.

Thanks so much! Your question reminds me that "send" trace shall be
moved before UIC command is sent otherwise register value may be changed
before logging "send" trace. I will fix this in next version.

For "completed", to make logging time as closed to UIC command
completion as possible, maybe I need to change the logging timing to
ufshcd_uic_cmd_compl(), just like UTP command completion trace which is
logged in __ufshcd_transfer_reg_compl().

If you have no objection, I will try to fix this in next version.

> 
> 
> > 
> > @@ -3760,6 +3786,9 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba,
> > struct uic_command *cmd)
> >                 ret = (status != PWR_OK) ? status : -1;
> >         }
> >  out:
> > +       cmd->result = ret;
> > +       ufshcd_add_uic_command_trace(hba, cmd, "uic_complete");
> > +
> >         if (ret) {
> >                 ufshcd_print_host_state(hba);
> >                 ufshcd_print_pwr_info(hba);
> > diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
> > index 5f300739240d..cf8d568d5a13 100644
> > --- a/include/trace/events/ufs.h
> > +++ b/include/trace/events/ufs.h
> > @@ -249,6 +249,39 @@ TRACE_EVENT(ufshcd_command,
> >         )
> >  );
> > 
> > +TRACE_EVENT(ufshcd_uic_command,
> > +       TP_PROTO(const char *dev_name, const char *str, u32 cmd, int result,
> > +                u32 arg1, u32 arg2, u32 arg3),
> > +
> > +       TP_ARGS(dev_name, str, cmd, result, arg1, arg2, arg3),
> > +
> > +       TP_STRUCT__entry(
> > +               __string(dev_name, dev_name)
> > +               __string(str, str)
> > +               __field(u32, cmd)
> > +               __field(int, result)
> > +               __field(u32, arg1)
> > +               __field(u32, arg2)
> > +               __field(u32, arg3)
> > +       ),
> > +
> > +       TP_fast_assign(
> > +               __assign_str(dev_name, dev_name);
> > +               __assign_str(str, str);
> > +               __entry->cmd = cmd;
> > +               __entry->result = result;
> > +               __entry->arg1 = arg1;
> > +               __entry->arg2 = arg2;
> > +               __entry->arg3 = arg3;
> > +       ),
> > +
> > +       TP_printk(
> > +               "%s: %s: cmd: 0x%x, arg1: 0x%x, arg2: 0x%x, arg3: 0x%x, result: %d",
> > +               __get_str(str), __get_str(dev_name), __entry->cmd,
> > +               __entry->arg1, __entry->arg2, __entry->arg3, __entry->result
> > +       )
> Personally, as those trace events aren't very human readable anyway, I would just dump the uic command,
> And let the parsers do their job.
> And if this is the case, result is redundant as it is part of arg2

My original thought is to log some exceptions, like "-ETIMEDOUT" in
"result". But if I changed "completion" trace handling to interrupt
handler, there will be no chance to log those exceptions. This is OK
because UTP trace is exactly behave this way: No completion event in
trace if request is not back. And if this way is implemented, "result"
is definitely redundant and shall be removed.

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
