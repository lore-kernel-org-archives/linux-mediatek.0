Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAFCC433E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 02:59:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06392070E
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 02:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdTkLXr1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rHSax3s5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06392070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mwvpjOFy2FO8lELY+4jUTKVunQ4s0BMjSSbgWIkD/js=; b=RdTkLXr17Tq4dsZIpF0kGNIjO
	1vVoEN7+mp5UJA8EYT4OEwjUFvyKMe+quLkzeCgT0IVHy8ncQJDXLnBOgLGsFhoiUUleEa3DQIGab
	8S/Sik1DHeDVsjK/W0e01j9dxljslng9TxWQKKP8Bs/229eeglKTinLwdFpHPTO9IOkRmD400RasB
	TSQRx29sv9nsLial9trdLDAN7y2ZD9NtDcD2rDhGGJwalJIPMavVOWtnyTug/0uEZRknZTf6EECyI
	SFEiSC43XPiC7A+wfXm8f6el+TV8Hm2G3U8Z2mTlBCngHxzO8dDyvh77O6f+DLykxaP+useeEAweQ
	DmrHS3IKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwd4B-00075B-2j; Sat, 18 Jul 2020 02:59:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwd49-00074i-P9; Sat, 18 Jul 2020 02:59:10 +0000
X-UUID: 39442d2227f046d09a148a58ec433c76-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6gkKHN2VVvizCwFgJMmDy6tc+BUb4z5fDOqpe6ABGnY=; 
 b=rHSax3s5IhGzQFxB5dxoiTLclQBbsrH+3cBki8T5WGt5sD5yXkT6LhHyHuOW2eeEJB9vUBx0BHj8GbQGQx7fG1yxgEAJXPljwoAo8k2o5of774lfHCT2rmz4eaTXYN+5D7kd08/p4EI2ktJUnW+YL5NCYlHidk5qL65R5OsZKdk=;
X-UUID: 39442d2227f046d09a148a58ec433c76-20200717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1600795740; Fri, 17 Jul 2020 18:59:04 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 19:59:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Jul 2020 10:58:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 18 Jul 2020 10:58:52 +0800
Message-ID: <1595041133.23887.4.camel@mtkswgap22>
Subject: Re: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Sat, 18 Jul 2020 10:58:53 +0800
In-Reply-To: <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
 <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_225909_994647_7B6C6C48 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eddie Hung <eddie.hung@mediatek.com>, stable@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-07-18 at 10:45 +0800, Macpaul Lin wrote:
> From: Eddie Hung <eddie.hung@mediatek.com>
> 

Well, it's strange, I simply replaced the uploader's name to my
colleague, git send-email pop up this line automatically.

Shouldn't I do that kind of change. It did not happened before.
Do I need to change it back and update patch v3?
 
> There is a use-after-free issue, if access udc_name
> in function gadget_dev_desc_UDC_store after another context
> free udc_name in function unregister_gadget.
> 
> Context 1:
> gadget_dev_desc_UDC_store()->unregister_gadget()->
> free udc_name->set udc_name to NULL
> 
> Context 2:
> gadget_dev_desc_UDC_show()-> access udc_name
> 
> Call trace:
> dump_backtrace+0x0/0x340
> show_stack+0x14/0x1c
> dump_stack+0xe4/0x134
> print_address_description+0x78/0x478
> __kasan_report+0x270/0x2ec
> kasan_report+0x10/0x18
> __asan_report_load1_noabort+0x18/0x20
> string+0xf4/0x138
> vsnprintf+0x428/0x14d0
> sprintf+0xe4/0x12c
> gadget_dev_desc_UDC_show+0x54/0x64
> configfs_read_file+0x210/0x3a0
> __vfs_read+0xf0/0x49c
> vfs_read+0x130/0x2b4
> SyS_read+0x114/0x208
> el0_svc_naked+0x34/0x38
> 
> Add mutex_lock to protect this kind of scenario.
> 
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Fix typo %s/contex/context, Thanks Peter.
> 
>  drivers/usb/gadget/configfs.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Thanks.
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
