Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC9C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qdoe7uBh5YdgvwDoXEs4z1E7HWiqcjddIo/k1Wuymko=; b=jH2AUmKBmUiTN7Nql/2JnTazVR
	GiC0G+ML/ewPm2mtYCTgxdDMaKgsEzzYDzVebhzKfNzLGt6pv3ZdP8G8gTKhqt1QhOqnEWvKSj2V3
	5I0oUpf4oXRBcE+qCLqq9FwUD8RPMMNKS+1UQjKNt5DeYIR6uzSJj4X5ZRRlRdCwnih0836anqAdJ
	M28k8O+3XWG5gkGVk+wfTpfi/IUeehWBQfA0IVx/sfxVNuMETGSzAeoiotiU8J2HUKwrSufoYZ/98
	wIgKxK8b2C6y8AummhhinNruG2CqYH69PxI7YPlLOPiRMui1UH0mfemu7jCyFngs0vdV8uLgPaoZc
	YZ/8jomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E3k-0047TM-T3; Fri, 01 Jul 2022 10:39:36 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E3X-0047MC-ET
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:39:26 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3176b6ed923so19075687b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qdoe7uBh5YdgvwDoXEs4z1E7HWiqcjddIo/k1Wuymko=;
        b=Xb91NjUW1NKOPKi4zPVohamVP+8ax7DOIzihV1AuAcHJuFg/wSUZ4VQSqo9g4umKKB
         PP3nvsfaz/wdbShIqCD2QerXBI4Oa/GDcwV/Gxr4OsISgq6SVElNyQK29wHQhiBHjTZ7
         3cT/zWNf4ePJBtSiNx5pKWo1zZx+eagvmQpws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qdoe7uBh5YdgvwDoXEs4z1E7HWiqcjddIo/k1Wuymko=;
        b=NhDfROhk5BaJ8yhEqWgeEdJRNGTfj1BQ1HqCRw9XoioX6DXWYppnaOiAKEW2PFMKc8
         q/2xlmRu96h/DxDG2b1rkJIAREskgvMbyCt+K2RPJ+FBUxdAoKniJRUWJ0mYeD0GCRAs
         XNJUSPdraLW7YxzUG8u2Z/8NiXTS2eKN9hPrK66P1LFRyD686QixO9mKz+XIV+HKBHcZ
         QcFS0tPcKz6T/YRTIEXReL+8gwTotA+rK3Sc/lFvTDRF7FefSieMaPt5n5mnc1krEx3z
         7yVRXMg5VaMkIr6Jgh0Daq+Ko+0/LZKLiqmCcfNDVK9t3gUG8QkAClgWGTt5gZgMAjA/
         mXHw==
X-Gm-Message-State: AJIora+1ejKpnZ0D4SISIWr/ysxCkhp+KaZO/jZ0KN34QbIAv7BWtLyt
	3IUU9AGNJIHb06evcvB0q10uvqLVnkGIbnScvpx+q7uhH+wi2Q==
X-Google-Smtp-Source: AGRyM1tbkJBX9Hzk5eZ2TzQQEIas6RfLq5EG7NxvFxwC+16yjoYuQTo0iO6rbWqDLmQcGCC2g9iUmZB7QTkK9dbk+4Y=
X-Received: by 2002:a81:2386:0:b0:317:6586:8901 with SMTP id
 j128-20020a812386000000b0031765868901mr15850223ywj.195.1656671960400; Fri, 01
 Jul 2022 03:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220629155956.1138955-1-nfraprado@collabora.com> <20220629155956.1138955-19-nfraprado@collabora.com>
In-Reply-To: <20220629155956.1138955-19-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 18:39:09 +0800
Message-ID: <CAGXv+5EmQRup7x=qsTLMj-90Y0TB7mAcisOVmwm4kFiD8Lhwrg@mail.gmail.com>
Subject: Re: [PATCH v4 18/19] arm64: dts: mediatek: asurada: Enable SCP
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_033923_528451_5254A19B 
X-CRM114-Status: UNSURE (   9.42  )
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

On Thu, Jun 30, 2022 at 12:00 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Enable support for the SCP co-processor present on MT8192. It is used
> as part of the video encoding and decoding processes.
>
> A region of memory is carved out for its use, and remoteproc setup for
> communication with the ChromeOS EC.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

