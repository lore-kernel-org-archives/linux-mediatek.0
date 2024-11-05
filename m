Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A8CD12663
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcU6PozuCPu9FYvIDE2uLOOUp6AETnyh7mULKCxSOMQ=; b=ND3ceE8L30F6DyJ6F5PvMCM/qp
	hq3wPXEfrFmfmY8h4mXtdEd5Y+rPV+dKi9Nr1RypM15uewinpS7J29ZMkmqevbgE2QulT5pusSrHu
	XZOGrTERSRLoAcbTyIxGzKsYmzac+zHj1Y1Sec//IlEop0vCrUMmKXbWK9gKsMfS/vQVYkBtTkDKI
	7A/+af0n33Tjl9FYTxWw0vVyCLXGTBHaF2naSU5xAt6sov6Edewd7jfOagzUZTX2r7V+wsXdHmr2o
	ZL7bFfI8S15r49u8NYZQHH2GCp1WdvIpPCtue+20UDKtB2qhQ8/ME0JAGV9lYPqFzhA2hcEzgtijV
	yDUsbQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FFQ-0000000GOjz-3RtH;
	Tue, 05 Nov 2024 08:49:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FFP-0000000GOjG-02Cc
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 08:49:12 +0000
X-UUID: d0a2d1869b5211ef82ff63e91e7eb18c-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gcU6PozuCPu9FYvIDE2uLOOUp6AETnyh7mULKCxSOMQ=;
	b=l3K0Q9lX6QSoD2uE+c61uvkkGnwNfXYF08K5DjPLwPoFaefbphv3OLJaj+7/+MDyNx/RFtha9j8srKer/K1qVGoicg7f+TnkNqU1o7W+Yk50yDKEV/FHLcXE8zNEh1it0wODee2XlodnZ1ImUaBHvwdfzYnsze58a9RpH26oC48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0e5b6c6f-7a49-4f18-b366-cd0b8a16bab6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:1f1595e7-cb6b-4a59-bfa3-98f245b4912e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d0a2d1869b5211ef82ff63e91e7eb18c-20241105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1463501613; Tue, 05 Nov 2024 01:49:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 00:49:03 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 5 Nov 2024 16:49:03 +0800
Message-ID: <b70f15ef-aa99-e284-9238-6e7b327e2237@mediatek.com>
Date: Tue, 5 Nov 2024 16:49:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] WHENCE: Add sof-tolg for mt8195
Content-Language: en-US
To: yr.yang <yr.yang@mediatek.com>, <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>,
	<ao.tang@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>
References: <20241105071549.17476-1-yr.yang@mediatek.com>
 <20241105071549.17476-2-yr.yang@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241105071549.17476-2-yr.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_004911_093810_4483C4CC 
X-CRM114-Status: GOOD (  12.63  )
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



On 11/5/24 15:12, yr.yang wrote:
> mediatek: Add sof-tolg for mt8195
> 
> Signed-off-by: yr.yang <yr.yang@mediatek.com>
                  ^^^^^^^
Please use git config --global user.name to set your full name here.
Do not use the same abbreviation as your email address.
We'd like to know how to spell your name correctly. :)

> ---
>   WHENCE | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/WHENCE b/WHENCE
> index 691291c3..dfa5ea70 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7529,6 +7529,9 @@ File: mediatek/sof/sof-mt8195.ldc
>   File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
>   Version: v0.4.2
>   
> +File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> +Version: v0.4.3
> +
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
>   --------------------------------------------------------------------------

Thanks
Macpaul Lin

