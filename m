Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EAD25032
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=; b=ycSQbXV9CZMwE9eoKvJYne7WJA
	rHjdi73Z5K4k1fNdFRXhk+VrMKZX9v7DfMl08WUTJOyiy0tw5lZeKp3DrRJkHIe3WZWnJU308RKS0
	N7WMpjw1KWuFpV6M6ri6ftiZ2eNCNfgYeA7Do7MSYTUtJ1zQajIIpSptivrlZsTBW9mVy/e8Aq1Sf
	wRy692mP+bhM3P2wPMx25+Iz5Xzxy6OabcBO6W9vPkeGKB3H0Hdzk6nGzEkV5sQidaQb+lwa7M2Oh
	8QtiLJMuHjGumCAVwnzgnP2C91llcIBhpUvXNpY1VOtJaUPBL+AgarO224U41woeXHJG7u8YAHURV
	dtB5Cmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCZI-00000004urM-34eM;
	Mon, 12 Jan 2026 07:42:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCZF-00000004upm-2avC
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:42:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59b786b2a5dso4644405e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203743; x=1768808543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=;
        b=Y/TQn5b99u09pF0zcOiXxul01iiu1re3ehsCAl++iiaVt6ZzvaFJfIFKvFbkcc6OaY
         fIHtMW6teGC/zu9JwGAPpq4meJ4xfNxE1PZHcDGqc2QdV8OEbgFabw/zLaN7xWQijHDy
         HaE9kX/whJnpYBa40IvgLJfZlfLy2RU7k4PNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203743; x=1768808543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CZe0kp3YvZifht9TF7J0pNQV6O4i3Xn8fgypmpyKvM=;
        b=czbUvRCw3kZqE/+7kMGAIHERMBy6Y/cE31UkNaNf8jqS5DNS9d+E2KYgBgJPkkAC1d
         O09kxA979PZ1vfehWluh/gvH20bawonLosLDwuX1oiBVpHfZvs1Op1MUvmL9VEo3w7rS
         i48Y0qdEMqxdNbEqjOm1rV3H0ChTITy4rH5VemZwQY1eBCsya+EoT++CpOWjmF/NRxwL
         a4Htoe7SU/4MdAhIVdMR8pH3vxLXTpEC/6NDR+DDGFkjIrhCDcGwmEHv+QUwKFdDmkys
         356JFRrRki4c1zrpTEo58dIzxhQhgeofmWdTOSYEqTd1+bAqb9T69qKf97jmtoi1eR11
         JQnw==
X-Gm-Message-State: AOJu0Yz16jIQ0UXDyWXL3JJ3mms5eQy48Zf2j2qoJnYcBzS0UqiEyQZb
	Iw0onyZiPB0BARpXH9giqYXfFc3RWfS9oUO4c4RE6n7ZD++UMftr6o1vTanCqpTKJjqb6AZrbGz
	ONMR+PjIQeK4a5pK5YiDPzEn7dEIT3fGGvtapCGa6
X-Gm-Gg: AY/fxX45/kNv9pEjnuDmuYOcUGW9d/wfOAKZQlHLUhoTwXB+Z3M1BaWfz4wWiJPFe36
	Xd4w47jyERV6srHdHtdRkpN2lLZf9bwiKVeaFHLmDw6dDFKx7LmXqtwz47zqPzrAcSgualCF1a1
	tCpPUls1slKq4Pzn92hQoNdGrpq87pyv09GASL6/WuEZYcrbCiCwZphTJXTfR0rwS55PqrZvY4d
	5xg1XbXS2wLRKj2fqmTezWI+QMnAk8Wx9zGSV+mV/VkV2S9NC4km2qz4cHc9eoHTR4GnGMu717H
	iagUge1/VP4rQrgBWfPDzK5z
X-Google-Smtp-Source: AGHT+IGVc0Z2JDRCQM5TMXXHmh/cYXBFfOa8+kLkLkYVFEmHdQa4U5SihlDMvs5L8T4nzdOAt8JPcoXc0kdii0T5lTQ=
X-Received: by 2002:a05:6512:238e:b0:59a:1819:277d with SMTP id
 2adb3069b0e04-59b6ef0285emr6512360e87.5.1768203743522; Sun, 11 Jan 2026
 23:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:42:12 +0800
X-Gm-Features: AZwV_Qi-sYgNZhY-tRMlNpjpDMDSuAUofyCpTvn8OEDgVdLKfkEI96a0JTlQ-uo
Message-ID: <CAGXv+5E=Ff6iJLNJg=_crWKmGWCk8sKpNCEtdEffF997JAnU9A@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-ns
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234225_652932_C29E54F1 
X-CRM114-Status: UNSURE (   6.61  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Remove the clock-stretch-ns property from i2c2, as it has always
> been (and still is) unused.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

