Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8033EEE258
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+Vvlq6kPIRv3v2sNDT50A07Twv9J2TV9GHlO+JqyOA=; b=umckJzb3M3c6HDpKkJN7jNwoLx
	cPK66vuvai29h7ujYJXJygJyysN9JZLb/dXn1ADAmwFap6wMyGtwYvvpbOG2Zw6HOC1Nq6GDNHeAM
	JxfW/Ml0AB4qFfde3mr5LItIYjeg6cABUcFVW91uF1fnf0cuZaZaoXccRBPz5kajlUYifgukqQGEN
	esNJgMQ7nH9YCIOzH4Z7O9cpTBcTPH6e2RTueu+jDw1baGGQq+CQgctmT7tP9o0PmVgQHt11ZZpQf
	efErRymmQN/mYa+UB6Ne2oNn21O6i6USX2xl1+IBr55lCRnoIx6oit/7GUS+KwsJUJC6OpyIyoA64
	BSkbIM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqRB-0000000EAd6-3yLA;
	Thu, 12 Sep 2024 20:29:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqR9-0000000EAcg-0PGN;
	Thu, 12 Sep 2024 20:29:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3787f30d892so149669f8f.0;
        Thu, 12 Sep 2024 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726172945; x=1726777745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+Vvlq6kPIRv3v2sNDT50A07Twv9J2TV9GHlO+JqyOA=;
        b=koxhvG1c269gYpXs1b+MU7//vSASXgotazShtKbmVbhh2SRLOl8J4bLQPCoT1f7fMG
         bxMGPSD/gUPoN9Eph2IkfWqaHhYrvU3meDUSPQ7F+VxmJ89qCr9Rro0VHbFUyebSCjGf
         w/NqKsuPqg8UoIgUywrRsO7cEpwpIdX1NRDksbKh3DAOTvD3Y2g7Mgmc8lukbvZvrtQq
         s+4Uvdz8t6XIDBgxcQfz60ydTu4N9tkWITVt3GAEGwbc15+s7ElESBfzz//0Soe4mvZZ
         BdgXI6CsyqCxYAF4YQ/htvektG1maCIEyAELfYuXLoSkqtafqhWvqfdtqvgSTrBkwomF
         O9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726172945; x=1726777745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+Vvlq6kPIRv3v2sNDT50A07Twv9J2TV9GHlO+JqyOA=;
        b=L2UjpmId3pZFiVbnIYi6yiGvxvTk0l5V9v2dewkcHWnbJqWQgNqbowsfauC31jbIjH
         h3gCc7bGxNUUKMHMznOCgCYKOnvKAYixZ1LmJDwhOCa4tm2X9taux6f7wRU1lqy6x64b
         V47kZKA3oaoc/rqCEZeC2K+edYDSgzW7VNESqLpn0vbCfsEviBKT9nJ5bmrFVCPBYCvd
         GuAhCbqfS0ilXhde/7DRwTY3jYlDZXPkFhGS6PgyQCUeGQ1VqhXY0D9M/RWp/DgUIMvp
         WMHVGwpShhiZ94kNTSDoeuIt/hefeREH1XCdkvgefmOXYuX9cBQCIsMSs8HEIEIwpqsB
         456w==
X-Forwarded-Encrypted: i=1; AJvYcCXsZN8+s/hhBhkqeJhZ9ydYjTdunPmGPD89zMmGdbZydmjfSkcTdTas8UDAlbkogvthcrTD9N2LiaOgYuoaV4MA@lists.infradead.org
X-Gm-Message-State: AOJu0YzH0H3XlOvEV9pbyareFaXXgvfm6BkaRNTFcJbp0MlKmB4dJoPF
	Fbf/H/yGbniwkXTnZ01MQcaN9RuzGJEIGkpJYLB1ECdnJDN4RiQ/CGNnNG39
X-Google-Smtp-Source: AGHT+IF6AGfDleGr42k1egNIDn9NzhhgPE6NVPwmZsDi9VTBrErzhGtAmkQv7+/UngllSM9A8ndaPg==
X-Received: by 2002:a05:6000:1445:b0:374:b9d7:5120 with SMTP id ffacd0b85a97d-378d61e2adcmr279407f8f.23.1726172944504;
        Thu, 12 Sep 2024 13:29:04 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c11sm15086968f8f.55.2024.09.12.13.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 13:29:03 -0700 (PDT)
Message-ID: <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
Date: Thu, 12 Sep 2024 23:29:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_132907_191077_F5AED6B9 
X-CRM114-Status: GOOD (  10.10  )
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

Hi,

On 2024-07-31 16:34 +03:00, Chun-Kuang Hu wrote:
> Hi, Shawn:
> 
> Hsiao Chien Sung via B4 Relay
> <devnull+shawn.sung.mediatek.com@kernel.org> 於 2024年7月17日 週三 下午1:24寫道：
>>
>> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
>> adding correct blend mode property when the planes init.
>> Before this patch, only the "Coverage" mode (default) is supported.
> 
> For the whole series, applied to mediatek-drm-next [1], thanks.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

I am seeing broken colors on an MT8173 Chromebook with next-20240912,
which goes away if I git-revert this series (commits 1f66fe62cc09
eb17c5909481 a3f7f7ef4bfe 59e9d9de25f0 4225d5d5e779).

To illustrate, I took a picture [1] of some color mixing diagrams from
Wikipedia [2]. Do you have an idea of what goes wrong?

(I'm busy with too many things so I don't want to debug it now...)

[1] https://i.imgur.com/tNFvovB.jpeg
[2] https://en.wikipedia.org/wiki/Color_space#Generic

