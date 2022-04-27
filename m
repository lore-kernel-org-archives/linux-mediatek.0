Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B49CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=surebEqYGuulFVKg6bOFUr1u+zk0AFDR2ZpXJzR6k10=; b=XH7fC5hQmezfHp
	Ki941uSTvFhzL6nf++WnDPOsLQQD/Lj3ak2Sn7HmFuaaPJvYVEjYJewPHUOfOff9lKgEkK3+ekunK
	W3Ce7zuoXp4jGeuPSaWp44N1/AhnDo4VJTrku4o/yDyupcZWcpxpDr5iFe8KMKaOcQPYAe2Ut5L4k
	Fkit03lwQI248qo/DrDs93vBjPFRf3osc2C0fBguoVnTQhquN31PtJcXekqP1fIhfSCIwm2hzPuDH
	RSy+eV8ZivH8N2++RutOHiritBnaAqnW0sxiSQlKNqbl0RGfWyDqHLc2LukicMPA3mnbEFXlmzigW
	D54TvOkv9uLBVE4Q/wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njatU-00HYML-B1; Wed, 27 Apr 2022 06:11:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njatJ-00HYGv-1h; Wed, 27 Apr 2022 06:11:10 +0000
X-UUID: 5fa0abab5d0f4299a37cd6ef05ac6bef-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:42857128-d061-4a93-904b-c17df2fad0dc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8beaa2c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5fa0abab5d0f4299a37cd6ef05ac6bef-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2031558120; Tue, 26 Apr 2022 23:10:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 23:10:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 14:10:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 14:10:49 +0800
Message-ID: <ec484303c7ffd2a851c7095d9468e10582666422.camel@mediatek.com>
Subject: Re: [PATCH v2 2/8] mfd: add missing defines necessary for
 mtk-pmic-keys support
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Apr 2022 14:10:49 +0800
In-Reply-To: <20220426135313.245466-3-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
 <20220426135313.245466-3-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_231109_138134_CDBA720F 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-04-26 at 15:53 +0200, Fabien Parent wrote:
> Add 2 missing MT6359 registers that are needed to implement
> the keyboard driver.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: no changes
> 
>  include/linux/mfd/mt6359/registers.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mfd/mt6359/registers.h
> b/include/linux/mfd/mt6359/registers.h
> index 2135c9695918..2a4394a27b1c 100644
> --- a/include/linux/mfd/mt6359/registers.h
> +++ b/include/linux/mfd/mt6359/registers.h
> @@ -8,6 +8,8 @@
>  
>  /* PMIC Registers */
>  #define MT6359_SWCID                         0xa
> +#define MT6359_TOPSTATUS                     0x2a
> +#define MT6359_TOP_RST_MISC                  0x14c
>  #define MT6359_MISC_TOP_INT_CON0             0x188
>  #define MT6359_MISC_TOP_INT_STATUS0          0x194
>  #define MT6359_TOP_INT_STATUS0               0x19e

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Regards,
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
