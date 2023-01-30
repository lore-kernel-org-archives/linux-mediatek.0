Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E2CC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbYOQUl8YkiJPsrRGZ6+9JqhC6vIn/U8fqF7NQ0FW/8=; b=mTej7rZUzbxg3TWgMZT04MOtkO
	KCwxTOuR0QsuYOHGPLkeQFC1kejRgEvz59aAhzp7k0FdYz+D5Yxv6QJM+7eVfP0vsClnz5MzgkwE6
	+HW7bYCTtBBjFfp+X6ptz/fDc9YcIEoroby0XBAxZJLT5FEyaebtISq3k9VZvqar3L7tz4f4DZGUP
	MINf/foLEupmoIyo/cKU7OX9QvMUSxx1KlyxSikVIy1qnZ/i4aH2cCdlRRix5sJcfNtlEA+UwWkLm
	mHDnVFGdNwUsIFMTJo1i4iP7GbhmcvvI6GIw7z6aggnlPvi7ZhIJ5zU1A2PFTn63/JEtj3IZrEs59
	noIXQbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRk7-003Blw-6q; Mon, 30 Jan 2023 10:50:31 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRjQ-003BkI-DH
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:49:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id p26so19243641ejx.13
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WbYOQUl8YkiJPsrRGZ6+9JqhC6vIn/U8fqF7NQ0FW/8=;
        b=ViX+vlUGX5BaP57CJJRM376Pvt1EL0A1wuWaXke5DxqeOY5dT3bVE3rJ3XRafd6XBG
         dbvdEqnA8aId1gPMR7LYH3a5ghGC6ptgK3A1k2wZUUq5utbQlMGSSbKG+rK28UVkmzRs
         +RSMjFrFJ1uE7tsd+ZdNNuCeVOwNIVbhA8q41vulASQromkI8HCGNOkj1+jXLCfhEiKc
         5vlPnRkHj21aJwuRRWcKoHO+J/vhxcY/lDd57zjgLTzshME0qgL76XikV0t9qNA6l750
         v1AKurPoH4qEAkHWr7v/PcFyFfCtGUhXl1JmRWskH7hSgLP1gnvD1bfU9eurASGMasPc
         ZXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbYOQUl8YkiJPsrRGZ6+9JqhC6vIn/U8fqF7NQ0FW/8=;
        b=XEQ5i6N+DYe+2ro2i5Uknf05cCJgS7XI3VklgpNh06P0cmhaW3uZbiOM0OGJJZQnzi
         IX6ph/30HCjmTNNTUJ6a7WYC0TF5GlGYlX6zizfJKoXLoxWyrqSEVhUbqB21KMjp+BZh
         VmLPg+/O4LprO40gOZFIoOjIJovLcmP1/gVI8snBXhcGocX0RFI0/CnZBKRzwmQip043
         EbxmrUmtGP6N8OIJDRsH+P7P178SIcBs35GCh29iEVttqcdMHo6R+JE0j4Le4eHVzqbg
         c4w/kXvZh8xFqo36bcxXhJayYEd46962efVKk1iN40qvrpWLJMz6TZRQu02KSkMOqO2k
         izbw==
X-Gm-Message-State: AO0yUKU0MMzcqE6ztAeJ0S1AkVr6vOMawQWHfZrxRIgHC6txvjsmrgb7
	1Qk5AhrW4whI3gmDSU23iBGiq6LSRYYv3XoxQaOf7Q==
X-Google-Smtp-Source: AK7set/J7PES+ljqawMieJJRd/cu/yzPZarw9tMyMY5Jntle7Jn7XPBW+FIYQs1uClIQZVIgTGBgF92r5iwxtvN2CD8=
X-Received: by 2002:a17:906:eced:b0:878:4ea8:6c2f with SMTP id
 qt13-20020a170906eced00b008784ea86c2fmr4129189ejb.115.1675075787022; Mon, 30
 Jan 2023 02:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-3-bchihi@baylibre.com> <20230126161048.94089-1-bchihi@baylibre.com>
 <2ce57abd-203f-04b9-f0de-8e524d6afaae@linaro.org> <b0b49007-7882-bb44-df26-8d2132b34bc0@linaro.org>
In-Reply-To: <b0b49007-7882-bb44-df26-8d2132b34bc0@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 30 Jan 2023 11:49:11 +0100
Message-ID: <CAGuA+oqL41XZ0bUDTY1xfZrhWXjFrT9aoX+nqMmXDdY7QDJ5Ow@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_024948_496357_082D7E7F 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Krzysztof,

On Sat, Jan 28, 2023 at 11:50 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/01/2023 23:10, Daniel Lezcano wrote:
> >
> > Hi Rob,
> >
> > I think Balsam took into account your comments. Is it fine for you ?
> >
>
> The patchset was not sent to us at all, so it is the second version we
> see. Therefore it's not v12 for us. It's v2 and it still needs fixes.
>
> I replied with minor comments (which could be fixed during applying) and
> the license concern (which you rather cannot change while applying).

I apologize for forgetting to add some email addresses while sending
previous versions.
The changes you asked in your preview comment are taken in account and
ready to be sent.
Please let me know what version number should the patch have.

>
> Best regards,
> Krzysztof
>

Best regards,
Balsam

