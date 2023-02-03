Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E07C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXxrQE0DVwanxphrseUxAjJiqhp6uGNf7pcWwsgpWEg=; b=Ls8XVDBUlkitBSQmxlGfy3npgS
	toJnUW+4tvxq8C6GQ4ehYvucFgqwXOSPVunO+poVQ2ZmSc+ZdKZxWdhE/6Ltn83wqHqW397AEQ1pq
	UpMqI3pjI2LQmFvGYpelUFslwQPquR7FMECbZHZjdZk2OvZNJbro2ATxwvsJ7s+DqaFlxuVF8KAi5
	PLHyBXCA6WJNgHxj8/RknxGtWi14HbG009VY0oqDG5SMC98M88v4yn/YH8My9R9DK3oxGmj28eHYe
	ZiViMfvY0SONu8yjc1ZReMGZksEgT+LFCLejAlmXzSIlBGYXGmtYM5iQBSS3rQNzCfF+441fsfxKe
	45yKM9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNppQ-000bYg-1M; Fri, 03 Feb 2023 06:45:44 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNppN-000bXP-BD
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:45:42 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id s76so2101051vkb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DXxrQE0DVwanxphrseUxAjJiqhp6uGNf7pcWwsgpWEg=;
        b=nWROuR0pj1Pl1TSRysKSwzECG02ERncxdz5Du78MZoQovrXI7EnpmAXBHYV5IJbpU4
         NMvgfqCm5s1STqR13XA1OTJIeUbSOpfB4XZ06Pv9JsGb8y1l23NZr2iCmtEjTorgnC+Z
         2JY5IQuTGFbBtjM9mVNKXtzsroj8K8xFseTYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXxrQE0DVwanxphrseUxAjJiqhp6uGNf7pcWwsgpWEg=;
        b=g/gEdUonElS05cLiRf9WJyOwrwtJ6fzApkT64tUr51v33WbXgaGv9H3OAIlMT5puMl
         VtDruOaps8OimdweNg34r9bNrZKIyh3gA9iGhUQ1Xe5kCcyNFKzriUYVAX6DO5gFBaqe
         2bv9H6yGObkUeqWhZsesDmj/YpIjUB4dPksCCTa0D6OAdeHxFIndFoqZeQXqN6riYKJE
         gd8Q/RJbVmcW54558kNsJZw0vkrO9Ma9I/5dT9vmHPUn1Qy23ULJcan3r6fgIAnV1SUf
         3tD5v+38fhCEX+p5NBb2PqDdb8HkW3VkfPfYN1LpB5PbkKvQPC+IOqLW7M9HLWu48Xa3
         iNZQ==
X-Gm-Message-State: AO0yUKWqi4hUeh9AvYpzqBuzz7qeeF2d+EpRDz9BWJCpbXcPsrKeWKJf
	bJUAL8V0weooiDvLh3W9XDJhKt7uMW1sCV9hXTdXjA==
X-Google-Smtp-Source: AK7set9N7s5GDlQRAmXm5uyJjoUg5jz6AF6KZ8lCLWBstusXFXE/r5U/501lgDv8HqpdHYNuecgcaP+dbJ30rnvNNUU=
X-Received: by 2002:a05:6122:131:b0:3e8:8f:f3a7 with SMTP id
 a17-20020a056122013100b003e8008ff3a7mr1316397vko.30.1675406738947; Thu, 02
 Feb 2023 22:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-5-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-5-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:45:28 +0800
Message-ID: <CAGXv+5GBG2Ehkth8atwueajdkdEGzb3UK5w8H4G98uRVd7U+Vw@mail.gmail.com>
Subject: Re: [PATCH v5 04/19] clk: mediatek: Add MT8188 peripheral clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_224541_401140_6F4B658D 
X-CRM114-Status: UNSURE (   7.37  )
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

On Thu, Jan 19, 2023 at 8:51 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

