Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5733AC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glBN85Rt3ApOQsBFR19xGhWj23PUZkptYN1w7e3kzW4=; b=oLT0yrheOq4Oe8cZT249WfSu0l
	ir4OGai7M9vFZQgEVgZgXFNf7byt3iF2f4Hk4i7iDyg2psm3IYUUuPrcuccxZuU9GikOepXwXmEaB
	QlXM9KuygFXfXNMrUVAtDAtuAFSAJHm3llqatyAUavLBR94Vz/G3nPMBwd35Wrwa+3XIHXOBRhWdR
	6+XtQOuRSIuB3Zj0ef0W5/bXaVtgSh9vnag3n4bgxId0UtHxO3y0U7IkM0VN3I+QPBi5oxYIkjisO
	inpLaYwPYCrkgnIgAo9+7VG+yeaq4PGfISP+6js31Az++N/z+8kSjHzeQFinepnacY1UrBghjiL2q
	dv9YNhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7tM-00AhTX-D2; Wed, 01 Feb 2023 07:50:52 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7tJ-00AhSE-7j; Wed, 01 Feb 2023 07:50:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z11so16765452ede.1;
        Tue, 31 Jan 2023 23:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glBN85Rt3ApOQsBFR19xGhWj23PUZkptYN1w7e3kzW4=;
        b=DRyUlm1zhhpn43neHrYjlg1b7J90De88ZvLd1hZBhVaMTp21J2NQ9m1HZ7w7kpp0VQ
         NDDpw2l+K+2ZJEGSrD7XHt27GuJeipn56IqMuAKTXvqn7U9fBL9JwpgzlVja45KvQN5o
         hAuKoBbDfOLSW5FaFeJB+gXrw4UziIvMc9Xff6MM4kZgDsnmfNlscfq+CZEj37TT7jzj
         dDmO9SewftPPSYv41YLasOzkiNc48pZXo/G8Swq6HdSL2EfAk0Y1DJpPwrKTxUNWz+WG
         y3BtbhV2F8SZ0Kjv1sBtNbEeu6JrGovtJe2oauq8vgytAt7i6t/+yDqBi2beNtO34/WZ
         pgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glBN85Rt3ApOQsBFR19xGhWj23PUZkptYN1w7e3kzW4=;
        b=4NgxxK5GtPO0symDQO440Q/8AgBS2UCQOZ10P+3qdz4XZFgF+V7hosxqgtOmF3Ylm5
         MDgg3b22qRfN7mExG2QAHJrDPISpzosgVcCUghLIX9xj95p40s6zpaW6yofTXraD9z/H
         mgLYWyrO99hBcBGxySVbEZoX+9BdmEXRLsov1xesMfJIwMnGa1Wd85DCz9xp4jmL8svk
         4XXQ2uGn35t/X4hmNrBCNf8SoSwy4k+wRUDsI5XTfpxxWdrxuB/JaqbnbZDV7BETOOXQ
         y6nSrV2zmd7pgM4v2Iga5irGpt9E4rJPkABTLxM1ANs2wvuM5waXnfZXWA/TNxQAyb6z
         UgAw==
X-Gm-Message-State: AO0yUKVZ2uo6ETCAsxiJ6H6L8yEkeK56kP30RsYtO8X6wy7QqgHhJ7Qo
	jCBlPm3rS/wE/pEobqsWL9JV+HQwMWM=
X-Google-Smtp-Source: AK7set9udwASp3rHYU+1pDsFfYldkdqc5fY3QHy8XaG+oyWra3rErQfyAuhCrcpz5D0ySJ2Dxu8iAQ==
X-Received: by 2002:a50:d79b:0:b0:49e:5ffd:5be2 with SMTP id w27-20020a50d79b000000b0049e5ffd5be2mr867638edi.40.1675237845584;
        Tue, 31 Jan 2023 23:50:45 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id j6-20020a170906474600b0088ba2de323csm2565358ejs.181.2023.01.31.23.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:50:45 -0800 (PST)
Message-ID: <0750dcbe-6035-d49e-9d2d-93a937b5c15d@gmail.com>
Date: Wed, 1 Feb 2023 08:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 0/4] nvmem: add and use generic MMIO NVMEM
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230201064717.18410-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230201064717.18410-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_235049_293571_B66ECD3D 
X-CRM114-Status: GOOD (  11.71  )
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

On 1.02.2023 07:47, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MMIO accessible NVMEM devices should be simple enough to allow using a
> single binding & driver for them.
> 
> I already replaced two existing drivers. With NVMEM layouts introduced I
> can also replace Broadcom's NVRAM driver but that work depends on my
> pending U-Boot patchset (it provides required helpers).

This was meant to be marked as V2.

Changes:
1. Replaced io with mmio to be clear
2. Replaced 2 existing drivers with generic implementation

