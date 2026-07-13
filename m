Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E6C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=; b=z6v8WE4/guuSF4wfLydRfKTJQX
	6/cr7/Cd73tgdQTY3KbIEOC5N973lwAA+4u7Wcy6/9q5YPkU/C/8kgX+CDM3RXfKFy/PxKuOexsv/
	s792h5+Ph2a/vXS8UZzGDP+8Q84neagkrUbsEl78UXtf72GJBZdRuR2SKX+HSZJi6pX+AGNunlp6x
	3GVaY2DJVTgUiXQ+ucOoDI+7wVZ/Ss6g2m1kVVfAD51EPnae49M3+aKcJ8NXIWUTWRbHX3yvk0ycv
	ivv3vecz7OAMbTXoysWdoRKK4XLpxzTEbhe3Sr/X6YxVYo0XhYwlL9+qzIu8XwlFB9wenPNdAaDHR
	8+sab2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6NL-00000007y4j-0buU;
	Mon, 13 Jul 2026 02:26:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6NH-00000007y3h-1TG9
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 02:26:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cac59f8b64so28834675ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 19:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783909586; cv=none;
        d=google.com; s=arc-20260327;
        b=JrzGES38h/ZsFd44mFgB7mVcTkDPKZpW2ZHiWhpITY9Ge9+jPE09fSk5FYaxxjfeXB
         Nucg0TwXJknt2f+chCioqgqxZ3RrMn/V6PIXhsPWy6/vFZrpaUsVPkDLAIeO92NhKRJk
         3BzRMpqE5qLmWY//1lnLV/8aOa4SROdOAPTZCz2+vfpjp9FafSdsf08+oUOUxP6n+D11
         n3S3JcBTkgYZ4Tj1quovqvIqnqYEXc3YaVczdPcrEundUfR46c5EEq41wsqH3PDTiuhq
         kZxiAjftke4GXITUw3LUl0505GDcPyDiKDqMszkeHcii79lYMyRn4r+LMZgKNXt6bMpi
         +UMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        fh=yO4VJJB8LOPAEpSjy2rpjHw5rALPd71EyQ/4ENfu98o=;
        b=hnutQ9EJIz+WJ5nqrJHRJpdn31sVB6wOSvzNWzQAlUaKK0cZxVFtP0BTeOJzCnifAF
         QVQ3/pPjKWx2sZA9ZKwxrLY18MXEjclLpLxT9kQo8tucweT90R6zJEOkiwAW8Fa3iyTr
         h07iaL6gaWBSl3+h924KJZTlVX5YXD8HvMH4yK32W9HiIZ+fDtVWkR8F06Yj2eNdphLN
         +R+56VvHsNUrA6SO6N8pUqLCG4KQ9IKbthBm0UXR31s8FsW4KgqmjGpAAnJ+DHuqsoVB
         TuLkDkntg9tiG4tLna7fcJU9hy0mN/aiyKntDOE9t7Lrl0aukyntRI7LqzHZDnAMUdIt
         Utzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783909586; x=1784514386; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=ngHu0EkAy2JUj5cX6ZuG6tX5v2Ol1q/uZ4ZgdfTB95A/UfGLBBOpAK7BOG04eCNq1W
         k7T9zPGzt2Pv5qoQOsPj3CNfyFJ4CDuP4lFFt0s5PSPg+zUmBcWDvN0N9OiGRaISOxCG
         K4ne6+cP7G5cIhtI8iVeq97/bxaI5Ykc4dGkup9bGBcuL9jvwC38TD5r1KKSuhw4QoR+
         1w3htImx0mDnPOp7Axc3k05l25x0QKpbKkKkPcsIXcXyRMDoqWG3SofuVpKm+ZYl4TW8
         mK31sBpNpIEA+dj7fce3hivFM5DDszvtVYkaTLElayTeO7ke0Hr3+mWd8Gy1SMOPfTDS
         JoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783909586; x=1784514386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=dozz2Hv1QnWJtCFh161k8y8bV1ewURAm13Hf1Z3dJCO/NJQCioFKHfmP/3yiXiF/JI
         gAsm7nWkcVXNIDONkmASoRKDCdv3XdKWMaPNldnzdj7KYhS7ZxRkGEGeOUKZEmEH548V
         T4Ib8BGm/VPeN3Gp2s7LnfEh2o6P1dDYTpAA0iQDYp5uONtfwclkNZlhHfkL2GzyHDdG
         hdumcsxH+sym1VFCh16CoTU1oS7ijJ0/6b+JQJH/YlLRWfsyfaAQtXqnub/R06Mr2GNF
         evCLMNlIteJdsz1SfchNqgQQyumz+l5ApjtZcERZXoVn16GHbk7lgec82MPEUYJaTtMo
         Cs5A==
X-Forwarded-Encrypted: i=1; AHgh+RrjvwuEkhh5nWAZ4gh1kW8c0itpSOyUoxp0In+xHQUxBsfWvZKEBMMRykdGBU2aD9I+KdWJisJs4wnaAzFBzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzvPai8RIEL1ettuBx4UP3Xv5LBUv7cLUI/oxDBVquzFLFR51V
	YPBkLxKz9Jcpaqi9AfeSAkeaQqHp0qb59OkGeMk5oev5Q12OyJgcEx4N3suVIijEzIhbojHFim3
	U0zp7Gmi7H9wEBaYs2PMH3bhkjUrC0eg=
X-Gm-Gg: AfdE7cn8rqXIdS++2F2HkdsL5lRFeynNUHeYqzg0EYiDWtXe79TIBozzp5F/od3BG8U
	Ut/E1g0VH43l3Xaw1SZNQ5bnH7wqTgUwwMe2Uf8ygORX23ZR0BJIf2K2ugRagZ5JB2HF5T1AdHm
	CrN2FqR+HjaxGfmgfTuiFPpRtWYJJ0Te95Aelr9S2c24grNSXc4aOe8X7ooBQ9yrUPgDYsEpc0o
	6CcxpzfD8aF6gNE32Y2CK5RboTfN6cU+sy80VmbBeveumN0/l+f9z7N5X2fFpnb82GurDlfmUVq
	5fzjGO8KmRpqJOebslPWrbcvHrODBGJTZ7AE8g==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id
 d9443c01a7336-2ce9f27e6dbmr67887935ad.40.1783909586414; Sun, 12 Jul 2026
 19:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com> <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
In-Reply-To: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 09:26:14 +0700
X-Gm-Features: AVVi8CcDb4bcqHg1Mp91TuPyHToFqGPv1UxLDhLLf3L4cwg_2AzYrLa7QzDha2M
Message-ID: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_192627_430151_2FD96609 
X-CRM114-Status: UNSURE (   7.96  )
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

Another point is: when should regcache_sync() be considered to have failed?

From my understanding, if patch application or cache synchronization fails
before reaching the out: label, then regcache_sync() has already failed and
should return that error.
However, the function currently uses a single ret variable throughout
the entire flow.
To make the failure semantics clearer, I'm planning to submit the
following follow-up patch.
I'd appreciate any feedback.

------------------
int paging_ret = 0;
 /* ... */
  out:
/* ... */

paging_ret = _regmap_write(map, this->selector_reg, i);
if (paging_ret) {
        dev_err(...);
        map->cache_dirty = true;
        break;
}
/* ... */
return ret ? ret : paging_ret;
-------------------

This preserves any error that occurred before out: while also
reporting errors that occur after out:.

Best regards.
Phuc

