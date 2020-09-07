Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7032FC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45C5215A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VA9Jb0qH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="hEXKQqhJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45C5215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YviOzMKnn3tJNqQU4s+mWcMh/93ra4H1oD7EaZ+TeyY=; b=VA9Jb0qHJRCuljOudP2+M2ioq
	k8ewHJuYX8U/eaPvYZiotoh/oPRJ6373zvrgRQNDldQroOfe6pe4oZU7HEzr2LR9cbgnnn+9EveBJ
	BsiMMqBhp9FZrtzJ2aWxb3MTOPytyN/sfrRECcWQfOWPWfWCujcOvZj6zN9N3WzVpm9pfAUYKgWAc
	thw44r78PCC8Sp+RtsZEUOZ1M5ltgZcHRaqTm/n4DGsylvqmLRKyfVWAglZpEyKPuMuH8yo7+V4qd
	/Eetu8hDlfWKKtF83v6QbbeWQOnJecNlD+WN11cgTqGccQF5FuB8GW8kaValub2+Ya5XFtTOVkv4G
	A3i0FxbVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFHKs-0003DE-Ut; Mon, 07 Sep 2020 13:37:30 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFHKp-0003C2-Pl
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 13:37:28 +0000
Received: by mail-il1-x143.google.com with SMTP id p13so12533468ils.3
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZpEmEr02MkgLosT7vPqFBX5vy+59cEEz8jZk2wlsPE=;
 b=hEXKQqhJ9NmSx4YCpKMr1NwW45bcnwzOkhMBL8DjeyYLJm78qmx6PfgWclUzVWmb2h
 fxaV6Sz2P9KxPrZSNITJVINtrvSAgSVSURAAgX1ASuRkdCqb7E91FrXanXeSPkc3ujAX
 +FFNNl0haD5QGCZw+GF/SsD6+N2HO6LCjCJF+VFuY1mxeUJW36pdkCIztgxwx60mVlQc
 yje66pdfUrcr4zkkHKkQoPkqLGdiP14j1niS7UWlfzNhCz3KJsftBXf8hOEiYD7uSXY9
 mrAxej+Mmxa5Rq3IupJGnTLeDACHso2O2gLPL+GCXy5RjeQSrH+CAHW5xCBbD046Gi6G
 Fe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZpEmEr02MkgLosT7vPqFBX5vy+59cEEz8jZk2wlsPE=;
 b=BUWYgpE7kH7sGiEHQTE2KouDo2iR12PSofqqMbS1D01zJOfioNE0APORZ1CuX1TIyq
 Oo/8mJpUCVj2W33yTkN1/wzv0edqGwN8V5egvmj8xGhtjYWIFu4xnaPYQ44TIjApclh/
 2MfEItP07kpC7apdPfdPpxSf2jNoLV/tws8xF0+ORI7VXjqeN6syKQPmltAQs0iayABW
 KqOjos+aKfOgDYqiQ666BtwFJuDyBi+FH6UaIqoQORCxDXwmimJtLgUjkT3wzVWliGtY
 1c4t5jPZ1C5jEk+yl4znIUT8rPWsB8Qv9bU9K36C+FZiP2X5NnNYq2uzt43s4bxhYHOk
 rCWw==
X-Gm-Message-State: AOAM5319UB/FxIPQb+FtmuPOzcV6Gh4EjGkCoqk9EXn23Sq2itzvPkTN
 1FgqAF1wQCMIXnfq8jOeOwvKopo5ilWfJIOf4vLzHg==
X-Google-Smtp-Source: ABdhPJyBenIIH2d8wv7qBpX9DpeJamhA8s78sQ62WqhL82+W2hjTg5gPuJzXToQlghF4RNr5s/7pUi3tIrgzsCAuZGI=
X-Received: by 2002:a05:6e02:c26:: with SMTP id
 q6mr19152124ilg.235.1599485843333; 
 Mon, 07 Sep 2020 06:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
 <20200819194005.GC38371@sirena.org.uk>
In-Reply-To: <20200819194005.GC38371@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 7 Sep 2020 21:37:12 +0800
Message-ID: <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_093727_847317_00E9C030 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 3:40 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 19, 2020 at 11:42:27PM +0800, Tzung-Bi Shih wrote:
>
> > But I found struct mfd_cell also contains member .of_compatible.  What
> > is the difference if we use compatible string (as is) for this device
> > instead of falling back to use device name to match?
>
> That's for binding the MFD subdevice to an OF node, you don't need to do
> that for a device like this - you can just use the of_node of the parent
> to get at the properties.

There is an issue we overlooked.  In sound/soc/codecs/mt6359.c,
mt6359_parse_dt() cannot read the DT properties
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/mt6359.c?h=for-next#n2640).

The original DTS is as following:
pmic {
  compatible = "mediatek,mt6359";

  mt6359codec: mt6359codec {
    compatible = "mediatek,mt6359-sound";  (1)
    mediatek,dmic-mode = <1>;
    mediatek,mic-type-0 = <2>;
  }
}
After removing the line at (1), mt6359_parse_dt() cannot read the DT properties.

The PMIC drivers/mfd/mt6397-core.c:
- "mediatek,mt6359"
- has the struct mfd_cell of mt6359-sound
- adds all mfd_cells via devm_mfd_add_devices().

The audio codec sound/soc/codecs/mt6359.c:
- "mediatek,mt6359-sound"


Here are a few options we can come out with.
1. adds back the compatible string in the DTS
2. gets of_node of parent in mt6359.c, and iterates all children nodes
to get the desired properties
3. parses all children nodes in the PMIC driver, and put them into
either platform_data or device properties
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/include/linux/mfd/core.h?h=for-next#n77)
- The PMIC is common for several sub-devices.  It makes less sense to
handle subdevice specific logic in the common code.
4. others

Could you share with us what would you suggest for fixing the issue?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
