Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC7ED2ECEC
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 21:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=; b=KxhuwLFbzn0zDoszvPdYbxqy2X
	hS26TFwoThfSnk7E/fpmV1nk3tbXFgfFbQqrx2E6FuJkzxrHt5SfAwiHeJjVaUfiIMoFptlFZ4fGL
	HM6NiTxGlvJKaPy/k6TA6pngTSFkGpHrV1u4m1tcismsfR56pe3uoGArIyW/eGdvhhzFBYeQC5/C3
	3+8XtLkzIJuu6gBumEvGnl07Sm01wxHAc0YhMp4zrLQU0BAIRNY2tv2KWAkQAQ5W+l20MlYpx4DvN
	WvJ8ivkPA2yr8oplYzzvCTDWehX7jbr5ioj9wUxh5QKKr2Eh7v1CPtCIJlnYoKi06UsIPnw9RxOal
	LHxNGMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjj-00000002tUs-10Z5;
	Mon, 19 Jan 2026 21:24:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjf-00000002tTq-0BqI
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 21:24:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a09d981507so35621155ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=QceoM0aB6evqiXQdValcAp2hHEbXx7TwvOI+LmTzfxap0vsgWt9Fuilc06Rnu+w462
         sZ287TjTeess5NJglraKe7QM4+qyO9MEUsB4/2t1WHpBTydlNS0TpzIO22m3f5AQW4RS
         ggaab9x9dORud3Jz91/Pgja4kbvS4RX7X65daKgSX5TxBTtG8BTPXuwi39DOQDJajqwp
         e0ARzMtWvauaXrOPKhSNQK+avMYanMHoFnZmaQ/024C0mnLecckG5cCqIkf6UZmK2Mfe
         h0o6404HmOUs3usu40guPF2wf3wN2aktDdneNOyajTBRN98OhEbaduYAEVuvv+KJ+Nkf
         ZD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=THajSbhqx9TShZsJLoC7AdMY3fIvpkQGnzeFmRKsqPs=;
        b=VjUu3C4H4/7ZHQMMdnzg1hYuQbda0Xxwyu+HqiFQgdwtqEIWv9xnavVq7s7sYOzhq/
         3Vj6BC3r1olhL6UgZAl9ZWWbkidkrIUqzdy4AykqAnX4ydN7+GIN1SVPWx+beGVwS1nA
         0FIUBqYZeFVzgnQ5p9jFz8XZwumQGlFugR4dlB/4jdXb66ZyaAytB6mjqtf3NbK55Sdp
         1TwEMWXu8dm65jyr+DCm8ET6/fsp4MRacy1EhqZaUOCp6s+9mvd3t9PVZCKULlKG0vWu
         64S1xxdzbijuivqLkQOJKB/gIFcxYh01ZJku7N5AQxfibiy+XfP7YiGd4CN3Jm5a0/5i
         QvDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=bJsohoTfefURwT4UVYR0lJQBNYYu1hVH+p8KqAlo1l/ChyobZoQzV0EI46XSh2y8cb
         OY780fP/He9iHngLaX/tNeg8fJCQvicEZnrgUIO8Q4HSn7RI+tElLY1AKfu8yRpkIx9b
         qM/xJIhbo55FUaghSfY8oyi5PGqbH5TxHpXuKwnQ45YNfybkewxw6vFLMeZnGiuOMqgs
         0ylmd8tueA4b8qSIJHPZRhgxAfyCRgRb8kJ/xkMf5brYOsdA9I50ZElprXWWa9RIFY17
         +1GvGKzfd3lU5lzpvdJUc/A2Xs5kkC57vSifgK7XAN6d7w9+8Am65FuTEvmaMpxRTlog
         xJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=aYopROq5tpMqBbo9w4CyOmcMl9xgqcOTWgU0HsOoZZIDGegH2w/M6FGaY7io9torSi
         xtAL2TRSnkEPINjkeNFqyIDZX8ylObMkk3QNChYX1nWnM2kdCZDgPw/8fpAecMIV1CSA
         q7tcm88Gx+zugzUo5m2qdMUO/FnpPQD6a1HQwZJSBljvCirxPMBf/fUZoJltSy3epXLJ
         chZV+NXdKwovsxkGNwQqdKudKSzYeNrkEXWsp9+906K9S2HVOjIbuvtFVigecgbk3ZOq
         BzI5A/AhsIA8Shm6LvsbV2ZUTQAKBaPMRN7qCCDoEIhJp94FkhqRqVoNX4Io5y51rjgJ
         e10w==
X-Forwarded-Encrypted: i=1; AJvYcCX3XOYP+sGO4WyNlk/KtGINUDwpHHEzwlYujnlc9YRUrbgJIjw5HIIQtZJXI4DM5tinP1TzeY6sfFDOH+ybOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi6gynyaNqKzlqaaTmCPMSEum+qcXyMQhBhAZr+xfqgEh6j0w3
	aN5ByD/6F/5SmhRPt3ZYfkCMIvJGZN/n4zlRgprt2hNowuZLKBmcPAXenwTZL+zFn7Z9r8LuOPg
	wEF3NB2h4nuogD4SLfbVDB36GdEdou7A=
X-Gm-Gg: AZuq6aJzaXfFL+LaRJwUB3hxUwN7snSLWUGPfufaBKglH0JS9fJImttBi8LEx8nHz1o
	z/dtK8D4SgWXFHiGCNG07HZ3Nf/AM85gIdDXCf6FSvesgsjuFVTEHqbo4gpZsbjlxNcoQWt19e1
	jXVbP3f/uepoG10KhuGkGNu91g9fnY+YlgE1odFllDgzyd/PzhUX26vmbS7vR83yUz8Ph2O9oQW
	aNwbl9d9D7QwI7t4oMKS48n8Z+9gPpwesncDtJJ9a9T9IC2bGe33NK0euROaneuQmacsMRM+Y5U
	NV4kU/eiOf6rvzUFsielt5ak3FOsG1FdzVvMAjo=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132431_138106_DFEBE3D0 
X-CRM114-Status: GOOD (  23.58  )
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

Hi Luca,

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin

