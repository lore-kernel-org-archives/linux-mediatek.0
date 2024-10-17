Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23611D37485
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAzYeyhGebQ0dEi2TLDVwCGX61/HFQTh+vNjDu3CzfM=; b=dYmLXAHGuFKZHCsVA3KadQITlS
	D2fBtJ5VPB3eBCn8l9tAfE06j/utQkZBiYgpRphoy08//6HfmeDHPfAqQIrXLj3b0wA3gNbIuMgLi
	eKwTa6rfK69kWX2jpsyvB9HOmr9UjyeT10bqeRiG+oESg7el/3hS6C69MNQ/VbMfRxzQ0tRqvEsDI
	Ujk00k2A3U2YheQqPfYjVdb65DkasOmG+QqWJ1srMfcbzQ6uR7Y3wSWVWoDxl17D9OPces4ccRN7A
	qMQZtzLx7WHlgYHJEbNn7irgjc9fFjJn/PgTk7IG8vEY72bCZuAYCgJrauM5kAX/MKyZDVWf7o5ZV
	ywEfiDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1QJL-0000000EtWD-3a35;
	Thu, 17 Oct 2024 13:13:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1QEV-0000000Es4c-3YIK;
	Thu, 17 Oct 2024 13:08:08 +0000
X-UUID: d5f59be28c8811ef9048ed6ed365623b-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=sAzYeyhGebQ0dEi2TLDVwCGX61/HFQTh+vNjDu3CzfM=;
	b=uyZ21wNlDkBj4Pf4lqVfmmU1Zjan5onrL7vASBAmPUYntWYh4mI7yTIBO4NppZpqEhekBdodHI/gsoCxZN7ngTmClw4KXjs78imTKC7QA9b7ot0yCHyoGcZCg0omz/d9tx9aswHFgOVPEtjLtPFD7PPoCgv4qGCP14dHV24qZIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:6acbeb2c-8393-405e-9c24-ab7d62bd4bee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:dc236865-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: d5f59be28c8811ef9048ed6ed365623b-20241017
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711525251; Thu, 17 Oct 2024 06:08:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 21:07:56 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 17 Oct 2024 21:07:53 +0800
Message-ID: <17a8f8ce-0623-2e65-deaf-a760862f33c6@mediatek.com>
Date: Thu, 17 Oct 2024 21:07:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND. PATCH v1] pinctrl: mediatek: paris: Revert "Rework
 support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Jades.shih@mediatek.com>, <ivan.tseng@mediatek.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, "Light
 Hsieh" <light.hsieh@mediatek.com>, Evan Cao <ot_evan.cao@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Bear
 Wang" <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
References: <20241017091238.180920-1-bo.ye@mediatek.com>
 <20241017091410.181093-1-bo.ye@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241017091410.181093-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.173300-8.000000
X-TMASE-MatchedRID: QW5G6BKkLToOwH4pD14DsPHkpkyUphL9gHzgwy8qV5oOkJQR4QWbsD7G
	etjxIg5SEH8iVoDMqR50XH1HHT0dkh9tyJCN9GW1+nWmWoRu6rE5vit32ngSw8lmyIrLVcm1tpB
	ukiTrasdP7y/XtCN0jd1d7aF3CVBvfnaS/XTl0BLhuXUWQoMQt0yQ5fRSh265CqIJhrrDy28Lhh
	yrdR5RU8z/3xojTGB1HIoH5j4GqUBI/m1jbRW7J7Muc03hWzjbsuIso71Vk6LJYIv7y0tu9gOR3
	tZA0vji4vM1YF6AJbZFi+KwZZttL7ew1twePJJB3QfwsVk0UbsIoUKaF27lxRlt5C0CRqm66uYV
	UUIJYEeWUQGHWRoNfxbMd1Bwmhjvo2Kdp6eQFqcuEtc7PqLQMJr9hTHcIyXRTAxQSHbx/8uvb6Z
	OHTB4DHzlz/HUVCh2B6+0uCqc8tyLs8R3TAgGUSPYQweeBxKQnqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.173300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DD1DF661CCD454EF9FBB90CFCF196A981024EA541D5F07349B705F1DA149245F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_060803_929895_15F353C1 
X-CRM114-Status: GOOD (  17.40  )
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



On 10/17/24 17:14, Bo Ye wrote:
> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]

First, this should be "PATCH v2" since you've already modified commit 
message.

> For MTK HW,
> 1. to enable GPIO input direction: set DIR=0, IES=1
> 2. to enable GPIO output direction: set DIR=1, and set DO=1 to output high, set DO=0 to out low
> 
> The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG_OUTPUT_ENABLE shall
> be implemented according to view of its purpose - set GPIO direction and output value (for
> output only) according to specific HW design.
> 
> However, the reverted patch implement according to author's own explanation of IES without
> understanding of MTK's HW. Such patch does not correctly set DIR/IES bit to control GPIO
> direction on MTK's HW.
> 
> Fixes: c5d3b64c568 ("pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE")
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
>   1 file changed, 27 insertions(+), 11 deletions(-)

Please add change logs in this section.
For example:

Changes for v2:
  - Update "Fixes: " tag in commit message.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 87e958d827bf..a8af62e6f8ca 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,

[snip]

Please reply all the questions address by the reviewers.
For example:
[1] 
https://lore.kernel.org/lkml/433295fe-8d34-af8b-f6bf-be1953b6e479@mediatek.com/T/#m168c6138c374009990025b0407f617ba10dede8d

Otherwise this patch will hard to be reviewed.
Any open-minded discussion contribute to the improvement of Linux code 
and the community.

Thanks
Macpaul Lin

