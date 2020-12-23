Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4ACC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3282720825
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 09:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3282720825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9mtXgct0lVjeWDEnHYSAJdU3rZfkW1KU297Yk7ew48=; b=xIq1EnEsGlAnB19vz6zsXpUWL
	gync4Uw2JWDlXLygpWUvt2+PpCMN/nPBKoxspfZgUcRlC7/DiVh2HGk14ogB8ao1iJ8OIUPJme4RD
	YKexmd/1I52JjasCgxDzOASlY0fagroyr5hsEgfY0ouFube2DE4mQHHyOUOBbEDfUKOvaoO/ndAH6
	gS1IKVPyxXtcPiir3F7bzpySIYkJ89dV1d/pJ6u+BS5hU3OxipNg/SFHF+18DOU5xhUoXsPBQwUFN
	LLO/T6HMYFsHoiRfYEiJiB4ApK1tgBVSCXn1GVh7Tug/tE37LludSvrEXwd5cZB6oUrXJfl6OUYwg
	RIbs4H1pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks0WV-000637-TH; Wed, 23 Dec 2020 09:33:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks0WT-00062Q-6r; Wed, 23 Dec 2020 09:33:34 +0000
X-UUID: 5a88da070ff84e66b5c4eafa43937e9d-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FCTr7Meo/1gfNbE3HTrp4APnGU2TY3DudOiD1TClv6w=; 
 b=a8H8feRVZksoBK9vbB83pJX/KnDOPB6HQBOaS4QLzQexK7VFQvCbHXF1NqZFYAwm5f1JW2Mo8IqKtCRiLI320k47iXjAMeHbmw4DV2AenTTlNhs874vpQX90RLON0EoLEqlrTpj5z+1k6iVEE+z326PF7BEx0RwS3N4SjcAU7TM=;
X-UUID: 5a88da070ff84e66b5c4eafa43937e9d-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 336049294; Wed, 23 Dec 2020 01:33:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 01:33:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 17:33:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 17:33:18 +0800
Message-ID: <1608715998.14045.8.camel@mtkswgap22>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
From: Stanley Chu <stanley.chu@mediatek.com>
To: Ziqi Chen <ziqichen@codeaurora.org>
Date: Wed, 23 Dec 2020 17:33:18 +0800
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E82613DAED4FA8FF2D640B8A13FCC1CB8454CFBFE82D18528678A7423E615532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_043333_443238_774650B6 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: nguyenb@codeaurora.org, cang@codeaurora.org,
 Alim Akhtar <alim.akhtar@samsung.com>, vinholikatti@gmail.com,
 Bean Huo <beanhuo@micron.com>, Satya Tangirala <satyat@google.com>,
 jejb@linux.vnet.ibm.com, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, kwmad.kim@samsung.com, Andy
 Gross <agross@kernel.org>, kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-22 at 21:49 +0800, Ziqi Chen wrote:
> As per specs, e.g, JESD220E chapter 7.2, while powering
> off/on the ufs device, RST_N signal and REF_CLK signal
> should be between VSS(Ground) and VCCQ/VCCQ2.
> 
> To flexibly control device reset line, refactor the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> new parameter "bool asserted" is used to separate device reset
> line pulling down from pulling up.
> 
> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>

Thanks for this fix including ufs-mediatek change as well.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Tested-by: Stanley Chu <stanley.chu@mediatek.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
