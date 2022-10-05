Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B63C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFcEY/E5BYvHxMQ2XfH4xnysOEBmImdGkFLvik4AJzY=; b=ztfwxc/q+Swo7c44VEGqbjM2Bn
	rh6cDeS4ekuXc3iiPEXHo0hiD5abkeAaN39HWHWF/U9+HPZfDDw+lhOZh45cIKpZGupq+kVWevF9T
	+hUn+ePAiqyWzVyWtkKvZi4iJDLnVxNPK3Yx+qZ1kVVXj5/cXEjaKpUdIlmKhGueS4SOJvH/nbf83
	cBOTgXulcpxq8SW/uUKrU2feHcYRXtHjLABZjfoVqhl8OFpk2zQ+WHYrTx0RpDvz8snhmMQAB378X
	ZdsBe+X8Qd0V7MFdJGUmC0kjXS4ba5uSmM9O5QtF18rbAPqZ9abBVFqFMi57WRNRGIa+nANXVy0eW
	I8x+p6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0Gm-00DEm7-Pi; Wed, 05 Oct 2022 09:00:48 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og0Gb-00DEjC-Mm; Wed, 05 Oct 2022 09:00:38 +0000
Received: by mail-qv1-xf31.google.com with SMTP id mg6so4851032qvb.10;
        Wed, 05 Oct 2022 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bFcEY/E5BYvHxMQ2XfH4xnysOEBmImdGkFLvik4AJzY=;
        b=NfktDo+qa9/7Fig1UFcwkllp7+G2MauCZZFqmWko49enFuBXZ3593ko1wv7CxmGth5
         IxcBl9GuukJuweb/CzTJn8J5oPT4FbpaxtMsFaBZ1DHcxMtA9HnGk5CQpvwuo7i158si
         FaW5qM++a1yxZMAJePJfBEmEF9em50T2irPY2F6VnGXv1F7W40LYnZADH1mw6V/3dBlH
         peGG5IKyuBlDoAg1peFHKMRKowh/JcEHHRGb4hMMEaO8Eyt1/nbyC63tuH74drGPiZu1
         BQS+gVZ3OtFJoiNlnbuGuYkhKiDvML5A+LC88XNbCWRo+iVexBDB+/P9d+RIA9uKndJg
         KtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bFcEY/E5BYvHxMQ2XfH4xnysOEBmImdGkFLvik4AJzY=;
        b=2vBTR46Mf5g+1aamZheZ1/sWWxT2eUZ1FoN+5x9f3XVwJwmGxlh9tU2zhALKTTf51a
         Vtb0JV3pb6nhrkHfxbLdPldkbETrxiMdzPG/2Gxw4x4KEUkng8PxfQjWnhf7AgppVUcG
         Xuysu5b4R923wCOrL6RYiJeAxVywB5QI05oCcVSV9vmfoaNrR5GShcaY+lYANxgAEraY
         K/F7bFUJQvidKA9ldWNT5LcX1vxJKx1SFZG7UdoBE0NKm5AtbKhHiKoL9qh5w1PRo/F/
         crqn+nb2NVMgURCdKc2/MCA55rIspuV6zMnvUrkgitRDMcWJk0wAFwG2XglJhAPr/i+3
         0DRw==
X-Gm-Message-State: ACrzQf1pmr5ZljqHd/7b0kBWd4je9khHWamwkM8PMrRi+ML8MlMzSRo7
	5AvBrBXCIcHqNoMhDyfmBKeTungVAGCUWG0rp5k=
X-Google-Smtp-Source: AMsMyM61Fj/fnFajeEN/tYSRNQs/vmZAUDDJZEH4jGw49cuWKOzFSPdDHaD2R2YLYYw+nq+O3/FkvKSTAx/Jj6tMc4c=
X-Received: by 2002:ad4:5be1:0:b0:496:a686:2bec with SMTP id
 k1-20020ad45be1000000b00496a6862becmr22619975qvc.85.1664960434585; Wed, 05
 Oct 2022 02:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
 <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
 <CABtFH5Ld91S65RiDu4iSpFhAMiFWaQdj-yDRM79=WUkArpA0JA@mail.gmail.com> <9004b427-66b7-f783-9258-4f6b893899ef@linaro.org>
In-Reply-To: <9004b427-66b7-f783-9258-4f6b893899ef@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 5 Oct 2022 16:59:58 +0800
Message-ID: <CABtFH5LLxjaWHFLRGjVb9x1a_SJoHzD_GsOqn-e9uQAJ6mOocg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, 
	matthias.bgg@gmail.com, sre@kernel.org, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_020037_759083_EEC50E76 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, Oct 5, 2022 at 4:33 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
...
>
> Eh, my patch was merged in July... and yours from September still does
> not use updated multi-led bindings. Was it even tested before sending?
>
> Best regards,
> Krzysztof
>

Hi Krzysztof,

I must apologize for checking our patches are based on v5.19 (I also
forgot to apply your patch before checking patches......), not the
v6.0-rc series at that time.
I will update the latest code and check my patch again and again
before submitting the patch next time.
I'm very sorry for this mistake.......

-- 
Best Regards,
ChiaEn Wu

