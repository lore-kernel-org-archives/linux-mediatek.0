Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E147CC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cExeY03ycwS+hRbiJaT4XqSqtteas/8iz3rsWbaWrc=; b=yPOYX7WBusN09rMD1Zh+839lcn
	LXwh01XqIX/TPuemDRd1ZzYvlGa66NOe857m/pJfiyXDolYAieXM3jms7Qr06eSJM0EJ36T9j+A+N
	1uVXf6G87RaQcjSVErUO+eQGc94fiLr9+Jljw0ReGc0oOh3MVIU/QRvXDe5FM1hfLNo+z35qs1LKV
	Y2nrwRJwoLwljlYWwixWFgRz5sKE1gg63c/ozbCwArZgSdiV3ohGcn3XxWr8frBw+2e7eKwO2Auup
	C2Zi9Q7bRF/iAzm9SBeRCUEYc3Bla6/O5Kf4kpOZwIqTSFHU7ni3Vwu7KuL2huQ0PUY0FnUxCCLtS
	p0iWnEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Xf4-002rYA-2S;
	Thu, 16 Nov 2023 08:23:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Xey-002rXZ-2Q;
	Thu, 16 Nov 2023 08:23:37 +0000
X-UUID: 6d1241c6845911ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=8cExeY03ycwS+hRbiJaT4XqSqtteas/8iz3rsWbaWrc=;
	b=TATRtYeeI3MjbhLOsWTiiy9Kscc1hPr6ZotvOu2Nefn62mB93s07F80x2VgKzWHMLeyFzUH7sGusPOvaiU0Xgzu+HEIaavzxN7QdZKBd88J/PWE15dTVL6vjc1e+yaTbrLvqNs9ODZyhr2tyVWh+qcYGJ/H1Awusw6Kgx2+ZBjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:24149ddf-d08c-44eb-9871-7e4f5000e3b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:f6032160-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 6d1241c6845911ee9b7791016c24628a-20231116
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 932237368; Thu, 16 Nov 2023 01:23:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 16:22:56 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 16 Nov 2023 16:22:50 +0800
Message-ID: <d9cc9f00-69e5-dd06-cac4-7a6dab0dabf1@mediatek.com>
Date: Thu, 16 Nov 2023 16:22:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] scsi: ufs: mediatek: Change the maintainer for
 MediaTek UFS hooks
Content-Language: en-US
To: Stanley Jhu <chu.stanley@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-scsi@vger.kernel.org>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <alim.akhtar@samsung.com>,
	<avri.altman@wdc.com>, <bvanassche@acm.org>, <peter.wang@mediatek.com>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
References: <20231116030123.10820-1-chu.stanley@gmail.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20231116030123.10820-1-chu.stanley@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.164400-8.000000
X-TMASE-MatchedRID: 6otD/cJAac3lpCXYECeZbya1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCvQYZJBBoF8Rh6L+ZkJhXC6ANGXBz7BHpyJ8zskw0dbr0Du
	2Dq3CQetkfYhY73aF9FzzIJrqcl2Q49E2aI0sGmEpoxDq3DugMlQQ0EgzIoPRIFBEE5CFomKY2X
	zxFRZR86tltIUUHBSWt2cI2StQCc0ryFHbNnBLGz2C05EXD5W80w14HFJQjaP0i0LZ2ZefXRwbB
	+iCKX6CF1pImo9Cx0VV8FbLD3om6QDBaeVuVh0CW7gz/Gbgpl59LQinZ4QefL6qvLNjDYTwsuf7
	RWbvUtyrusVRy4an8bxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.164400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0FA6FB6069DE4962721B3F66BA0F3B6831940FBF97A971466076C9ED8FC03D602000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_002336_798216_C05DCA0C 
X-CRM114-Status: GOOD (  17.44  )
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

On 11/16/23 11:01, Stanley Jhu wrote:
> 	
> 
> External email : Please do not click links or open attachments until you 
> have verified the sender or the content.
> 
> 
> Change the maintainer of MediaTek UFS hooks to Peter Wang.
> In the meantime, Stanley has been assigned as the reviewer.
> 
> The original maintainer, Stanley Chu, who can be reached at
> stanley.chu@mediatek.com, has left MediaTek,
> so please update the email address accordingly.
> 
> Signed-off-by: Stanley Jhu <chu.stanley@gmail.com>
> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be1cbc6c2059..4f6fb3357947 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22102,7 +22102,8 @@ S:	Maintained
>   F:	drivers/ufs/host/ufs-exynos*
>   
>   UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER MEDIATEK HOOKS
> -M:	Stanley Chu <stanley.chu@mediatek.com>
> +M:	Peter Wang <peter.wang@mediatek.com>
> +R:	Stanley Jhu <chu.stanley@gmail.com>
>   L:	linux-scsi@vger.kernel.org
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained

I could also prove the user of Stanley Chu <stanley.chu@mediatek.com> 
and Stanley Jhu <chu.stanley@gmail.com> is the same. I guess we've 
better to replace the email in MAINTAINERS before we change our jobs. :p

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Thanks for the contribution to public domain and excellent work in 
MediaTek from Stanley previously.

Best regards,
Macpaul Lin

