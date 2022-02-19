Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Feb 2022 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfLvgIOSXgiyKzwXrKifBSm2Xwrf9j5mdr/Qb9hzsGI=; b=Eaq010FbnVcdhm
	TPn+4z4O9bnzWd1dkPQ2pz84rIedzCloB0menwgEe5oK4sfTWVH/D+Z5lRl5oEtkvyIvRpKpUqNXr
	xas7tNCfP2LXwu8TQzvfWkH+t80wg6BTo9ht4BTFAKtvD2q9atotNOFQX6WWumR5Z5I4qx86fszuS
	acIeB3V8F2cfq3v2y6TqgKzxcqMrE5IPHzfzUv4lrXMS7PTIHOcZyp3LG3KmdsA7LbLZ++wK8REsy
	ZMIza/qNznUpe5DEEQcVye3vYPcTFxGDOoMmndi27L4thDUOuT+gQqVQbxMxCO8zYuYaouTQrrYab
	E1AY1QxQUU/+OfC1L5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLEOX-00G5GU-H6; Sat, 19 Feb 2022 01:18:41 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLEOT-00G5Fq-6N
 for linux-mediatek@lists.infradead.org; Sat, 19 Feb 2022 01:18:38 +0000
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2d646fffcc2so83900307b3.4
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGT/rZxYfeIRN4PryD3wZUZkIPDyk0u8ZLHZrKc1pU4=;
 b=MRmdeVmcNKEnsHTomHtBMiUm3AzGlkfp4v26DR4HhiHWPjXOB0goSG+7RD2Tqgaddj
 s03PxJp3LR+6iT80KJT+9CBPMBrzndI0wGzwcBwSwqT6soz0wsOXWpFJSpExX9TJirsp
 regrFDTKP9RArg6cxmiE2IzLY8GgQxZTqLE3cQcPkaE5+TFayKzY279pe11wmz8065wf
 QFwHyFcFMAwpwOMize/32bHk34fkf6qD3NOIcCzMz20B+sPPPtvQrMbq3ipfkAV2wUPY
 ZE0yoBb/ASfLmSke9ojlYCc5KRk6gjl2GubqzwacKg7xqnqgoadNG8RTZaHUR4vfVgRj
 +VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGT/rZxYfeIRN4PryD3wZUZkIPDyk0u8ZLHZrKc1pU4=;
 b=J5YOUwDV7jeEjiXVhWk432LdiPFsahNYLQwFzcVk3xQ5JcfRaqJeQTqW6sSh1fYgvq
 APlaxBHiRlKXLD1N8GB8GqDG3BoBo1q9AqmOFNM1g7sLo8dShd0eP+io/jd/mKTwjzpB
 VUQQ9rsBvEQOemoe0tClVOr5LLra4s8ghuOgUWleT+3fdYHBrgnJ/UNPUTdHinaNlvXQ
 76RZmJNOji9EyZ1P8FUCyP+/i/pxjUaNzra5fCocEZAGBf6Zt7rQCqGjez291SoRYxjn
 un9Z3PlDJ73JwVy3Jf1gPhHfsetWoCypHXXr/C4l/05bLF5oxpQ7prdwFdMfFn3msXWk
 P/QA==
X-Gm-Message-State: AOAM530aP2J4sitjnbJTU5EJUUDh3LlUw9yUGCMyXuozxTuHLO+MGcQJ
 mkERuLHVhZa7eo+HJcFWEdpsxH7edriba3/jhasSjIrNKY0qWQ==
X-Google-Smtp-Source: ABdhPJx4AWqwViXR95drFaA/1PmHTlK3qOQcUR4fd+92TEe6IlEg5Gc0YF60g9HzAOXP0I8wgHinz+bSWpmmm678Qzc=
X-Received: by 2002:a81:1e57:0:b0:2d0:e613:a2fc with SMTP id
 e84-20020a811e57000000b002d0e613a2fcmr10099613ywe.151.1645233516167; Fri, 18
 Feb 2022 17:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Feb 2022 02:18:25 +0100
Message-ID: <CACRpkdZOX7Sxc6hSJV8+BBgeLpHO0ZGGh2nW1WW7NDO6Qc_LMw@mail.gmail.com>
Subject: Re: [PATCH 0/5] MediaTek pinctrl drivers cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Cc: sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_171837_266474_C3B6338C 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 10, 2022 at 3:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Hello!
> This series performs some cleanups to the MediaTek pinctrl drivers
> by commonizing some functions (reducing code duplication) hence also
> simplifying the probe mechanism by removing unnecessary per-driver
> probe functions.

This looks fine from my Mediatek-untrained eye but
I need some help to review this, Matthias? Guodong?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
