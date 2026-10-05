Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBD0CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+wwFVK6KHQeaI9uRymOZz39D1QHGigoaSM3nqJFb2o=; b=x1SzvLl93NzercEJrFf3lRq78Q
	PD8bX0cTp0XMq7v6R88zrdIpl1RBRniVeVfs2R5iQkyvsuvfywebEbBUL0xzgtnkREmbxxF3M6fkN
	K2FyS0O7u8/F54Q/lSyYJNrNP6BcVW7762yejoQA3coYTfXGHsaAG0xGmbqknlGw6UqbfvovFJFqZ
	KqUI1R9UAK1EdiaLKoDVinoNTNE8SDM3tE6DG72y69OCweL28zu0RmEAP1cQ1nS11s2LcRc3mUlnZ
	rqq7ao5ocqInIpWh99foy2WA5kesToamyuqiwCwXz8hB6DWARl8pw7tIIYYLr5yH09u3hYiXkMMdX
	kVBe38cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe9Y-0000000Ftu5-1jyC;
	Mon, 05 Oct 2026 08:34:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe9U-0000000Ftt2-1Cyv
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 08:34:31 +0000
X-UUID: 91a9b4cec09711f1afed4741b24580c9-20261005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=w+wwFVK6KHQeaI9uRymOZz39D1QHGigoaSM3nqJFb2o=;
	b=T82Yj+bfTswDS50xJKmn8YEuCE/0gz5Dwpekm18qsdMCgRXxZ8QyY0yuTzaWVgb7zSbQ+iLJTYSZIIFYAOHQN0tWuZy5+lv2gB04NdpU7rp/LJwUdFQ+/uQ2WyLMF48ahaPJwyNDLmz3JedCkaFb6TdOg0eVPOVaLy9gjUAFtyo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:e36d5d76-f8fa-4181-a54a-220faddf5c43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:0a3bfb94-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91a9b4cec09711f1afed4741b24580c9-20261005
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <alice.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583677297; Mon, 05 Oct 2026 01:34:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Oct 2026 16:34:21 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 5 Oct 2026 16:34:21 +0800
Message-ID: <be68524572540edfd87ec4b5f25c28933ccd45f6.camel@mediatek.com>
Subject: Re: [PATCH 6.18.y] scsi: ufs: core: Re-arm the device command
 completion before submitting
From: Alice Chao <alice.chao@mediatek.com>
To: <martin.petersen@oracle.com>, <bvanassche@acm.org>
CC: Sasha Levin <sashal@kernel.org>, <stable@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<James.Bottomley@HansenPartnership.com>, <avri.altman@sandisk.com>,
	<alim.akhtar@samsung.com>, <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <peter.wang@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Date: Mon, 5 Oct 2026 16:34:21 +0800
In-Reply-To: <daily-reply-20260915-0008-re-ufs-dev-cmd-completion@kernel.org>
References: <20260915052638.459390-1-alice.chao@mediatek.com>
	 <daily-reply-20260915-0008-re-ufs-dev-cmd-completion@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_013428_328721_801EF3E1 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2026-09-15 at 21:52 -0400, Sasha Levin wrote:
> > Re-arm the completion in ufshcd_issue_dev_cmd(), immediately before
> > submitting. All submitters - ufshcd_exec_dev_cmd(),
> > ufshcd_issue_devman_upiu_cmd() and ufshcd_advanced_rpmb_op() -
> > reach it
> > holding hba->dev_cmd.lock, so no extra serialization is needed.
>=20
> The analysis reads correct to me and the patch is clean against 6.18,
> but
> this is a stable only change in the UFS core completion path with no
> mainline counterpart, since 08b12cda6c44 ("scsi: ufs: core: Switch to
> scsi_get_internal_cmd()") deleted this code outright. I would like a
> subsystem ack before queueing it.
>=20


Gentle Ping.

Hi Martin and Bart, any thoughts on this one?

Thanks.

