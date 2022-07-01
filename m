Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF2AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhSJpdElfxLJFyuRKCFkIgo8J87kpfyiNf5gNwRrRdk=; b=d4Qvbz4t4oj5g5nWgbyL8zouPW
	jj9yZEjP2iNMAWKjg5fwxxFohAwdikVo6sHZRcn46XK7znfNK/+G1AKVLNOrVSmvM4mN3xmH7b9cq
	xO2jSHNk0ifq1Bp9O3kox84s7j7BAyW+/YFtBZ1vU5k3g3VWle4Y28tyPGNpeurhZpFPhySedO5kM
	UoQNPi0Zq3Qr1h2M4EslniXG5jN2C9VB0YG4dVCNQqHOJhTh+tV5KoOYHQ3VS+mhukP0NWXrWA7D9
	978yryBTbTeMtKwWCazejugxOsiVStyNspDbBoak2xkYlPZfa/UbKbRafpwyP+CVw1zJfyFYMvg77
	yP+C1Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E42-0047dh-FY; Fri, 01 Jul 2022 10:39:54 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E3x-0047ZR-MK
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:39:51 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 205so886589ybe.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QhSJpdElfxLJFyuRKCFkIgo8J87kpfyiNf5gNwRrRdk=;
        b=ocasRLLt7ZDwKINnqCUl5FR0RNg3PQjS5gXEQjvHSeo7W055JZlxinK2HUcaK9w5bh
         eSN5A/+QtNlO1aX10mlD2JbNYLvX64ZhASo914nhKidpwAtpvu4Sta1SN077iSfCpy2t
         CkzOa6S94V0kN8rvcfmrtw6/E3rj5yp0k5AJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QhSJpdElfxLJFyuRKCFkIgo8J87kpfyiNf5gNwRrRdk=;
        b=SmabEd5Jj7FKHqwvZRwjomAO6J8ajdhyMpadKiPZOeuqtzpKxE/oP9I15GLtEbqI1B
         MPQ+DmJb5JwPPPDa2LxEXKbK2HkJcSi+bVuK3OCMX+KFVr+sV3vRROjw5HADNgsSXH9w
         fDCuWsuziNk2TGjSfh0AHHsh0fiHrj8W55N2XrjpHsWSEgxYvZF6nYLSz7cHPBU0TohV
         NuZklgH1z5uNh/s2eWSIjmJ3qglbWcj6+g1Yys/AF06m+Q+mXuL65VyeCdGhyFZ+PFRa
         O3hy2jlK2+PMRm54rUww0nLwricPJu1OJj+Qr7Fkj45OV0L1MWiaW8GsI0BI0/8YiN18
         IcnA==
X-Gm-Message-State: AJIora+hXSkfRrN4rypUvWfmA8xJhdPevPcvuqJIBGXVC0BYM2vX80w/
	cBbDyd76r1LB6vDsRg+L8wISzDAFqF5uYfRp3+9pTA==
X-Google-Smtp-Source: AGRyM1vft/EQMm1oncXjofFh3jIP3Ex+EX4u97g9AM0PzBmMCHK71dtxNdvf6XCacmM+Xex1pm9BVN9k7B5IjJg8Hv8=
X-Received: by 2002:a25:7801:0:b0:669:b51b:10d0 with SMTP id
 t1-20020a257801000000b00669b51b10d0mr15080419ybc.204.1656671988852; Fri, 01
 Jul 2022 03:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220629155956.1138955-1-nfraprado@collabora.com> <20220629155956.1138955-20-nfraprado@collabora.com>
In-Reply-To: <20220629155956.1138955-20-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 18:39:37 +0800
Message-ID: <CAGXv+5FEM0UNg5vCK3qF6yzhCPWDryQx0iEzhFJJEQQhpx1M-w@mail.gmail.com>
Subject: Re: [PATCH v4 19/19] arm64: dts: mediatek: asurada: Add SPI NOR flash memory
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_033949_800704_96B3F557 
X-CRM114-Status: UNSURE (   8.60  )
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
> Add support for the SPI NOR flash memory present on the Asurada
> platform.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

