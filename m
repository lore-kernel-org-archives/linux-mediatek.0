Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpztIzOUweCMDiklxcq8aILJ4Uv//aqOB6NGxeltMTE=; b=osydaUCvqxklE4
	npaRcnafB+7cWQXgchmYe0bVtHsXb61MMa9YDQxlft8gRB3EIUxUMBBiIn2+rfmXUdFs0LbclCSpV
	apcynguChEEgAdiocnJ1CjCNazKBUgVUL411uEt4TAf5BPeysoiJDaqleWA/KohqdkhaiYPI+Hb9Q
	h9Sa3nENvmydNiSXvL0GLdQQ5u7NDjwPJ85QkihhdWd0d0gv+kMBhcysNXWQr9w95t6S3oh07FCYi
	X4Pgm6+26Bz6uNkrBHt1QnMG7HjDObGozXgGzUqz8pzu02QugQpZ1C3KFc+KUZuRYAmsBXrwubCMZ
	BduhslVox6bwt7Bjw9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrg2w-006ykn-Hd; Thu, 19 May 2022 13:18:30 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfyR-006wMp-Tz
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 13:13:53 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id o80so9014980ybg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pU36f99eaZPxWc0unxPX9BsTsHo3kBMFnigWJpZIqUk=;
 b=NkuSkM4NnbBU4jIXuNzuDcd7T3EznqprgLSY+0J5GlXq39Kk/bVSP2ZVAEVvwGrui2
 DWUDMGpDhK45ebpEZjbwyxZCpJ6XPoMR2m8bdehall8m/mNmGrMaHTDV4r5lrvX4KhC3
 Szvu3aRZptzycSbdxytyx8zvTOfVLF5U40bgGBUvLv5YDO80Cbaw2EgPT7GG84ybLcFQ
 VK6n8/IGKs7sF47Ctc6cgtp7FbgE097cQFfmAvwe9Ao/egbTPxoPRzsyIcpPwZc0bJUX
 YyEi2MzopnelF92IZeXztApu885ZF4fBJty99yI94ZXpkdRsbxd/oc66q65lVBwMLd+h
 t+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pU36f99eaZPxWc0unxPX9BsTsHo3kBMFnigWJpZIqUk=;
 b=V1YVb7J47Et6petRw7oWpX15cRJ28sOy+Tw1NE/etfbjUzQ5ZAPemhVirSEqpndIrp
 zyWL0WtL3uaYiCCbo2vPI6HywZ1vf9GKbOdgTC4f3dF6kewb4l7Gv0Dcu2IqDKmbx9k2
 DiYktQD9fxt7GqVN7BYoNXKkBZn9OCEj+Eurnlw/EQAp3b8y2wezpFb9399+fHdQYh5u
 7h6PPdaktvD9TQeMtPkItljZJPFV9AoGz5iRd5sa7b0mdzRdDjaIyVZSYVwr8oNYBXzV
 mlHgE5TdQHb8isNInL+k/lULTSk7KIZwCQylwAIK3TgtwkNOPwuBoFtpIZhG1tNtrzGT
 XoJQ==
X-Gm-Message-State: AOAM532PSqt8Zal1hFiIV4Qk1bGYEqd7jsntL+sWQrmY1Y2UFDTOIGKT
 sJtnjo3idc6ZVQUC/poRXtmRIMDo8qDQ0JQ56ixwMQ==
X-Google-Smtp-Source: ABdhPJyJIP7Hag/4KdBY4u76XwIRxLNZPBE8+9JcpJlpRiGV0RoIBhT0aDk8kici5QeY4pJPkV2i1OGCVw41LmNy610=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr4392907ybt.626.1652966022951; Thu, 19
 May 2022 06:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220517083957.11816-1-angelogioacchino.delregno@collabora.com>
 <20220517083957.11816-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220517083957.11816-2-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 15:13:31 +0200
Message-ID: <CACRpkdaj42rcQdX1+dVWyHmexrq4UDQHB0JLHgfREY9kn0zv2A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, nfraprado@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_061351_996472_89A162B7 
X-CRM114-Status: UNSURE (   8.41  )
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

On Tue, May 17, 2022 at 10:40 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied, along with patch 2.

BTW nice work on the X10!!
I can see from the feature matrix here:
https://wiki.postmarketos.org/wiki/Mediatek
that this enables a whole slew of cheapo phones and tablets to be used
with PostmarketOS.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
