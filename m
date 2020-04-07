Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D76C2BA16
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 07:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EE5206F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 07:01:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBO6eMYu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QCDaE+PM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EE5206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKvTpQIysyHBQCE2B1WEBVtgPuIS3uEI+FlHuXn2gaA=; b=VBO6eMYu9PoZsA
	FnCHCqZeZtFO8DIe/ZX7uoCs1OfFJCawe4k93iIeQbY7YpV3+7xNCmTWLqqLwCjJ2sjqXLd7ciFSe
	m3TVl4Rjs8RX34Kumbn/YNP/S32brKX4oLX4rwPHD/LGNC23VYAak2voe2d8QzpKeWKMQa742LIlY
	jDCapxVgAtLY5Ugi+gbKz5te49K6/UZsm9wE+BOjne72vZ6rC+gqnap6xVLa1YRguyD0uniLMYHrm
	+KJDlUxpZu6/Hn35U+M7+8H6qc2m/r5PtK2McYAG00OFlVA57C4nYmk2NCKfJkDLtvBNE44ztcA8S
	9iQpZq40SGMxuwhVj3Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLiE9-0003nE-Od; Tue, 07 Apr 2020 07:00:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLiE7-0003gb-8k
 for linux-mediatek@lists.infradead.org; Tue, 07 Apr 2020 07:00:52 +0000
X-UUID: 6826dbab530d48f4ba5cab9ab52b0a65-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=90ccjNQIm3aIkIokkHZonC7L4E55DM1TNyxvh7zJNG8=; 
 b=QCDaE+PMKmfuJTJOZi+tcZCWZ0eU7d9ThVcUUrnEVw2JOV/qCxicEyyXAq8mmiSdPNl9A+3raP0nYdVeI5hwOqrCyOXGe7yVi6Lhp9Hk1BXT0gbd0mIPcR/kOV5Rx242O8PiwW2x1ni4iPoG0BAlDctTmKuJCtZa3odupYXSpGA=;
X-UUID: 6826dbab530d48f4ba5cab9ab52b0a65-20200406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 624970940; Mon, 06 Apr 2020 23:00:56 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 23:57:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 14:57:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 14:57:54 +0800
Message-ID: <1586242674.19903.0.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/2] pinctrl: mediatek: make MediaTek pinctrl v2
 driver ready for buidling loadable module
From: Light Hsieh <light.hsieh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
Date: Tue, 7 Apr 2020 14:57:54 +0800
In-Reply-To: <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
References: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
 <1585569648-14017-2-git-send-email-light.hsieh@mediatek.com>
 <CAGp9LzoJ1MiqQhoRnqEgrTP6FycVGJLSQR41FOYK85ic2cgmLA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_000051_317785_9E2F6BAD 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-31 at 14:15 -0700, Sean Wang wrote:
> Hi Light,
> >  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, bool pullup)
> > @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
> >
> >  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, bool pullup,
> > @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
> >
> 
> I got build error with the patch
> 
> ../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:529:1: error:
> redefinition of '__ksymtab_mtk_pinconf_bias_set_rev1'
> ../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:503:1: note:
> previous definition of '__ksymtab_mtk_pinconf_bias_set_rev1' was here
> make[4]: *** [drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o] Error 1
> 

I will correct it on v6.

> >  /* Combo for the following pull register type:
> >   * 1. PU + PD
> > @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> >  out:
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> >
> <snip>
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 83bf29c..8823c0c 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> >  #include <dt-bindings/pinctrl/mt65xx.h>
> >  #include "pinctrl-paris.h"
> >
> > @@ -633,6 +634,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> >
> >         return len;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pctrl_show_one_pin);
> >
> >  #define PIN_DBG_BUF_SZ 96
> >  static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> > @@ -1037,3 +1039,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
> >         .suspend_noirq = mtk_paris_pinctrl_suspend,
> >         .resume_noirq = mtk_paris_pinctrl_resume,
> >  };
> > +EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
> 
> place EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe) exactly at the tail
> of mtk_paris_pinctrl_probe definition.
> 

I will move it.

> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
