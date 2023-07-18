Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00553EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZL14WYA0DLZ0DKyW91vgmsuwYwiL4W9V/M4FZV2mU=; b=1F+LxaOA5DPu8iJnRbSBHIaLnj
	Y8msewFRoHVn+zB/mIPBowBpkWMPkYPF3LZ1O1E8qQl8O5kceB8pc0xw7Xq6k8pcObNQbrOlckN/7
	DB2k056l/RIsBoYfgs2YovxIiiPxy+9dCKn9m1Mk7bQF42kwF9bzcAQfgqoewPAI/BzJpk/pBMgrC
	xxnnMxS4FNf3J66HqTAIlIJb9X17cKYCh6Q3qCMmvKkYJD0QnjJn6jduipzbZ64CyaUiW0Bz6K1PN
	Tn85geauIaXgKbsUZ9aJFqw/78cJetzEU9cmfhpCEEEzKXkB0YkKRV+4fNLAIPJH12C2ekYBZYX+n
	DlDFaqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzfT-005GxS-2U;
	Wed, 19 Jul 2023 05:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzcw-005Ey4-04
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mUZL14WYA0DLZ0DKyW91vgmsuwYwiL4W9V/M4FZV2mU=; b=M5Vlw36tP6x8wQYcNun4HZ59oR
	j9BUo00/PFJAgckKmUKn6rthLAScsZ8T77sglAB9OqMxvmVz2R5tF94NGsvYrUyl67zhK8EnlaeBq
	dsJb4FTIsqdG9FwNAup37wV6FtxDZoFYEaDqQ7r4U1D3B9dK62e4k+XHxUkh4m/uwHTaDR8GMD/6c
	9602HlGoUx66pcuweol/ivWVZURi+auaP2WbcqPVwwdX1Z+GHU0YV2YW1lQGKqAuK7xd2zU5gQAR/
	N5BjCElYqlqV0fixs5uWsUO5zalFQ1BhWfkYKrXl6kRnIfHGc9lcWSfobzdttAco1Wa1NT4EQwnc8
	/ZtNsUOQ==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLftV-00BIoe-2q
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 08:17:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3403431b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689668171; x=1692260171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUZL14WYA0DLZ0DKyW91vgmsuwYwiL4W9V/M4FZV2mU=;
        b=hGRDAxWQq0lSXMjHoJ296PI6/9fZqpU0/qu9j0+hbW6LMSinvy5OHGGYY6fVwdZj1u
         Ndpfz6c8E6GrT+U6aqf9RaKO6JwOwUR1hND3Lvo9s+JTrgqJO2cr4Pv6O3FeR1s9ZVC+
         gRPvUBvYgyDpwuxl7tvDeXQlqVXYR4JP1KUig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689668171; x=1692260171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUZL14WYA0DLZ0DKyW91vgmsuwYwiL4W9V/M4FZV2mU=;
        b=ajm+/QJaKVuQ+hyYwvUQOcTdkM8l7hpW+VKdgOuRvxN0Mrvo73KuTawUK+mCR172p3
         osYwoqR7R1xYdbBsSfe6eJm6BbDmAZ9/5y4aAtSMNHou8pnxzKlN91KjFPxWINjwq11K
         CR9DBlSJ0xyP9qmKLkGrgppqleI1aKPESuwBJ+JY2fe/eJNVs29Scvi9iMMa7oHgzUqM
         fP1ig+/UzpR7ALOiSCrXUVHKZLr6BDxwLw7B91I9Hz4XXxaDo0qiRRn6LZ/Ug8GtI66M
         JXlZpNJb6Hm3ABO2xhsK1VMwmh4b5UsEXj67aM//5Hyt2SAz5XdnFLAYoWGVVDZTA+eZ
         ynBw==
X-Gm-Message-State: ABy/qLa86jThs78oHlna9aR5xuDXdLFRV+0XS3KtMUXkJpkx+U1CGXjE
	I77Y07lyHRdv4AI6XWSLj3wIMKUSCK+NGA3i6b8=
X-Google-Smtp-Source: APBJJlHBJyXHUUD9edEd8KDr2jV/wiAsGL3crKSIaOXXPbwvyUQ1i6Bx+wCgNIHSCPevRTHNRFlpYQ==
X-Received: by 2002:a05:6a20:100c:b0:12d:208c:acaa with SMTP id gs12-20020a056a20100c00b0012d208cacaamr11210432pzc.26.1689668170842;
        Tue, 18 Jul 2023 01:16:10 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id i5-20020aa787c5000000b0067aea93af40sm1013101pfo.2.2023.07.18.01.16.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:16:10 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3403427b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 01:16:10 -0700 (PDT)
X-Received: by 2002:a05:6e02:2144:b0:348:8aec:179c with SMTP id
 d4-20020a056e02214400b003488aec179cmr2013630ilv.32.1689667770016; Tue, 18 Jul
 2023 01:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230627063946.14935-1-shawn.sung@mediatek.com>
In-Reply-To: <20230627063946.14935-1-shawn.sung@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 18 Jul 2023 16:08:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng0sLRt0vhB2Rpk_vetQLu9Kro+JREWf-wpkkO6dNKiwg@mail.gmail.com>
Message-ID: <CAC=S1ng0sLRt0vhB2Rpk_vetQLu9Kro+JREWf-wpkkO6dNKiwg@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] Add display driver for MT8188 VDOSYS1
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_091718_012908_DC235860 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Hsiao-Chien,

On Tue, Jun 27, 2023 at 2:50=E2=80=AFPM Hsiao Chien Sung
<shawn.sung@mediatek.com> wrote:
>
> Support MT8188 VDOSYS1 in display driver.

I'm testing this series with my local MT8188 setup + an external 4K
display, and I feel there is something missing in it.
With these patches the external display can be lit up on my end, but I
only see glitches and no meaningful content is rendered.
Could you check again and send the updated series with the fix?

Thanks,
Fei

