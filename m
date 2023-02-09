Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA54C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22xHVaizGQeKTJvsqtfI5zTT40uK/PwvcQY9ndeXRhM=; b=HNTgIei0YAkLEO3d+NznJCEAao
	tnqziyOCJWkVcRlFEWbKLG5qCSrYacZqiXdozPMCZECEf4wWE1cl8rxBqkkeKS8Mh88rPxsMXEq3y
	GECBtXtzwMldHfoCgVoqgzYZKGbmsbqWp+U5KFW1apfblSVzT839VxxWbadoDz6H/0Jg5sIZjgtY5
	FSHAR6G7DyaiuAl7KPX+ucqcOlN8zpiPuqTkrcR4xUqNiXLgpThJhnDVRPYUYG2mKWoy0jsp+FR+I
	uQYYWyJjsn6xp37sG5rIK6b9UjfA1EfcdLvRx7z7/gaMA21NFtdZxVdg2NLiDl+HJ3tjb6X7jjetK
	s3ONJzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2cV-000bYM-RR; Thu, 09 Feb 2023 08:49:31 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2cS-000bX3-Nu
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 08:49:29 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id d66so1357922vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 00:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=22xHVaizGQeKTJvsqtfI5zTT40uK/PwvcQY9ndeXRhM=;
        b=nEEpvk7/fdi+G4pqGRp67+yXUNRS9lFzkJh9kf6sbHjy8/UxKIbI0VqqffhzwZS2pa
         oiBb8fdNaKoWz+iGdBMH7HIDvnywsSa/qktrKHgqmY6E0Xd35NbFH0LC0Se2ufdapwWL
         M/666v2WvN1+4gAnk0Hk1aS0jGVqHGi3Qaxec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22xHVaizGQeKTJvsqtfI5zTT40uK/PwvcQY9ndeXRhM=;
        b=FmiuwadxVkQPZSApcEFlsOh/+msFCYc7gBiVAoTovaxD49mZJbqEBPRxLAe2dnjiwp
         cqe54H1oud/zEnYSNMh208iy3bUzP10SACq8aVkNHaJl8wKHEUQJFQ87XuXi7bnFT/ym
         m4XDd40hbjv0AMW++buq+aIf+5XcNUTnQj1L8KINDZp5fgANo/kyRXNzIiryyeS/aFt/
         YU3juuTi1mGXgrmD1Tysz8pRcc+3wWcRRVw/x76bK4HFFFE6HSv4c5Keau6ru4X9neUf
         fdAaG0cwO36KxSi4Llw0M197ciXi69ZQNNN4zNVwQ7JOyHVrccYoE580CDh3BfL+gaNL
         nAdg==
X-Gm-Message-State: AO0yUKUq4X+v2QY0WXnovaow9wTVeDhWjqO1YJc0dU6C0qx1nK1MaL9E
	smUdjWXic89dv6HyU0OAErpEBEwe4+/UKWgeqd/OzQ==
X-Google-Smtp-Source: AK7set+QkzxKXW4pEMAPFic1Jd0HAeOizDIe+SLOSX/iixyH3n7tgpUonX30kC85rHKw9l8o8gB7revPyLNojTYB0e4=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr3105328vsv.85.1675932566080; Thu, 09
 Feb 2023 00:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com> <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 16:49:15 +0800
Message-ID: <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_004928_815420_B01AACC4 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com, Nick Fan <Nick.Fan@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Get GPU support on MT8186 by adding its compatible.

I'd skip MT8186 for now. We have to work out some binning details for the
OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
the OPP table. We were just looking at the Mali driver today.

ChenYu

