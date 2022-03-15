Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65erqsuUG8i6CZVLP9ev6DQJ+jBT+3fcV+XffolmYnY=; b=BQ9n7lCjv4M+2p
	L5H4+mDeqpobp1lkX79hcQjIc67JeXks/1dx+Xgc2OO5mNFNCkBU3dVwmMQzNTeMHLHwPoTKs2mnW
	RSXcVAZG3eNQ/jENkQBRQzAmZzo/e1BdXPQMJvX+dwiNwp9zAtKaKQCPnQUfPYm9DOmcNVvzD56Ot
	2FjFEcMPwf8/+zzr24R7kEzusn7lAOrgBN/w2lOZ6AIrRa0ivcyrjDHftbOs/Ifd2NV8EiCiYNaag
	mcW2ORKqHJbjMJ7M5wGr77uj3lEheuFB6d0ZJgI2y3u4M0CQOMgi+yJWUTf2Gfedct5j1qq/9H4IX
	sLj1pU1KwQPVs5f8bo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTucv-007END-Ma; Tue, 15 Mar 2022 00:01:25 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTucs-007EMG-PN
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 00:01:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id l2so34090230ybe.8
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 17:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Hx8gzlcnA9WQe4/nRaiJeKdSgiXZDA8CSlyHo2MoEU=;
 b=jcHH0Naib9/jGqvrQ1aYDeQe3af8nnI2aVm55ZrM2tqkwPQZn77OZg8GBKl4niqFlQ
 AgaFjT7RvjJ1AtNBsiX1VKChX7x2LCEBUrwA4ucBUbp+gNR+ORBmJ7+O91o1H1DRkdzZ
 IE80u8haFRV+iUSWtskB4AzB1hgZlQvsiwDTgviW2XjmenxrO6BOvb0VMtE/mFkNiFM1
 duwvtqqfBzFKgdy2HKekrDBNDHC5cL2jHfIk6dwXOzAPWNKms4SNu4Cznl84wLUduZ5k
 AsDyPAX/JN0LPzP6m+1z1Qm/u8oNdK0JLnr87UllvIAwirMbxU8QFDQeNOaroPoUgKsZ
 nkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Hx8gzlcnA9WQe4/nRaiJeKdSgiXZDA8CSlyHo2MoEU=;
 b=P6J5pX4eTY78nE7bbogaLy0WnN3myS1aT+6bb0JZUSAQgnv9K21ag79xix/BOhV2cv
 EUO7jgsVdSWeQSyoP3KRJUyHHh9YeGt3RHE0M2XoEqIRjd3ah/6NSytMLN71Zn1VrNPI
 2tz00KAvmeqejZ6EN2mwIxVyxvOsOJcsFEs6xBGjb29QNIC063GbGow3djku8f5n8UxX
 Zt9M86+tkw6wDHscAH512f+lS+axXkZCdwkKLd+SBLVPad+ZVxyIpZnItD408N7841Rl
 JVo3WcvjzTjkrSwEal3lXMaVee85sWil/5Y7auRjMBDm00vOYskqv52hGqzhQg3E926Y
 6u5g==
X-Gm-Message-State: AOAM531KSwhQr5ZA3uAtEnd+KMIHadeyrZwaMuA8Aw4RluDFa+c2LxE7
 LvHAYp8prGDM6zlk5mmivJ07PwZxoD+ZlL1VKA4FdQ==
X-Google-Smtp-Source: ABdhPJw5LtCuJ+XoMQAG1Kz6dZV2htXDgYWN1IuTcwXuEzgQE4YVaS5pBngW1oMfQeA9WTvMA9GcUMZRxHPHeRyBljA=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr19792106ybr.295.1647302481820; Mon, 14
 Mar 2022 17:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220216032124.28067-1-guodong.liu@mediatek.com>
In-Reply-To: <20220216032124.28067-1-guodong.liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:01:10 +0100
Message-ID: <CACRpkdb5t_rKzRy6+NFy1zbrQstPXNMaUndvNvt6VOfiN2z2mA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: mediatek: Support pinctrl driver on mt8186
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_170122_881294_FFC8BCF8 
X-CRM114-Status: UNSURE (   6.93  )
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

On Wed, Feb 16, 2022 at 4:21 AM Guodong Liu <guodong.liu@mediatek.com> wrote:

> changes since v4:
> - update mt8186 pull up RSEL type define value
> - update mt8186 pull up RSEL type si unit value(ohm)
> - update macro definition name
> - update mt8186 bias resistance selectio register description

Patches applied for v5.18!

If people have more comments they can be fixed with further patches.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
