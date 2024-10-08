Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8280DCED276
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsFPi8az/OyA/IN+aGhSiXgEaCG9NxZV5cOQ19PcFbA=; b=GyfMDjXBNaZLUW4aJp9NrV8JD7
	WVQQ+Ew9haWLCSBY743i4W+chtB5vOqjKsrekUjuuG6c2Y6PGH/pPH7OOf4KG5+374efXtssJn+4F
	LwomjKswMNe/C6KniGzeAg0RemcjiSRQGbkp+z0uuRtLNiOOLVguKOUz+w3HXINfmwYa+6pRUaqLw
	rrbRp7ypoUQPfzCl2gEqztClmaBBiNWzmIedzUhUUz1eWgPu0THyqFjbCWL1jazAKAhFddEza/61g
	Bk/Aaax1RFDmLwD2cHzQfO9fjxQPpP9zzXP9LhcYJgGDb1ATT/nGrFIv7J91hoaBTv1d4mrMZMkRc
	rFs6kDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy56z-00000004uj1-2NG9;
	Tue, 08 Oct 2024 07:58:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy53V-00000004t7i-02Gm;
	Tue, 08 Oct 2024 07:54:54 +0000
X-UUID: 97612724854a11efba0aef63c0775dbf-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=VsFPi8az/OyA/IN+aGhSiXgEaCG9NxZV5cOQ19PcFbA=;
	b=V1Q0lJ7Lbf7xdTkBN5EccHZnIjKIGksvmEO+szXZI7xE51kPyPXQvZYdwHFQiUSl4jdip1L2pGGxnRdMI7LKBzy/DOIvcci6RZIXRDueM6cSh2lZx5kKlBZ8mFvVYSFX6gYWUnPwAQXso5MKvSlJvH4M/ZDZow6KnBWgjQijruo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:49bd3992-de37-4581-844f-c41c9d097a56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:5a777626-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 97612724854a11efba0aef63c0775dbf-20241008
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 962791526; Tue, 08 Oct 2024 00:54:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 15:54:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 8 Oct 2024 15:54:45 +0800
Message-ID: <b1e37466-bfe8-cf26-fafa-e8556c15788b@mediatek.com>
Date: Tue, 8 Oct 2024 15:54:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible
 for MT6359 keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dmitry.torokhov@gmail.com>, Sen Chu <sen.chu@mediatek.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <chen.zhong@mediatek.com>,
	<linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel@collabora.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Bear Wang <bear.wang@mediatek.com>
References: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_005453_102901_E0DF3B2C 
X-CRM114-Status: GOOD (  12.46  )
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

On 10/8/24 15:41, AngeloGioacchino Del Regno wrote:
> Add a compatible for the keys found on the MT6359 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index 70567d92c746..bba55a81e6cc 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -28,6 +28,7 @@ properties:
>         - mediatek,mt6331-keys
>         - mediatek,mt6357-keys
>         - mediatek,mt6358-keys
> +      - mediatek,mt6359-keys
>         - mediatek,mt6397-keys
>   
>     power-off-time-sec: true

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Thanks!
Macpaul Lin

