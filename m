Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C7C48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O4/FEfA+7IjxF8Rp85VBJ4sBehSYPl7j+rejDvNsk4=; b=qhM7M0oSYRiR4c
	hw6wFMJVw6OaJ0OZOMwRBr7pJu7DJFOJeRQSZ21DbQQyNJjd5WAqL/OHYva8ZpDUIX3WgbXAhsPZ0
	2oW6Cd8+iM+vZKU2uf4/XqeiG4thLWsZGW45IyqdmHBf9PPBfN+3aq20Xq/IpjKUsguRfREhIl3sN
	GJ85SUq9q77BMwXGnwDOUsda6sST6d+8IFzcjYvP7JE2KcjznTpuYk5zsUN594YQtJ41vQuyyOP2R
	XjSLpHxIM0jb5jm5k/kBeRbOxi6mok3k2Q/OzJGQt/ronE7nJ/0YU2BQZT0l1u76GMsO30sYS1wrj
	CyIg/MYlxTtTm0LJ1+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNFI-000000083i8-2rLI;
	Tue, 06 Feb 2024 15:20:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNFF-000000083et-10lW
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:20:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d09b21a8bbso12422931fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232812; x=1707837612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8O4/FEfA+7IjxF8Rp85VBJ4sBehSYPl7j+rejDvNsk4=;
        b=iSLZTVtnhopf8HUX2yxh75DK4JYvtfc3POYXlMDaTGRDeJOoVQkk4xTm2kcUiholo6
         ETolqj+8SYTx9aDfoNYS2eJP6sjEQorYNhFbrD43WVas5Exwri0NC104wqaue0+NQMy9
         TeNOeFuvNb+jlfjiLx3ciT3UshOKoPQf3jjzqEo9dQEXoas0llcFB8VdQfTs064fJjIE
         iQFS3oLONKWejhlSPdy8l/sAO9TUD4cs9kQo/Hrb+FlGAH6b8y7+hITol4n4bDqb/Oq5
         JcTVDDq3TWvbfN9OoPNwtyP/CN3jM0otuRBnyinb0l/XWQdxf++LEicktAnXi5BP6E/V
         w0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232812; x=1707837612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8O4/FEfA+7IjxF8Rp85VBJ4sBehSYPl7j+rejDvNsk4=;
        b=FJQm7KhaeD5RExpLSEpMJBqEzjHB4SaiXFtRs/t+wAsgJjvGHW2jZrdGlMUG2C2+QJ
         0w6mXHEnqLHfIwv/Y795d9nD6kURyLW0nq8iy6hozfNEBNQSHk3Mw+8fqpk/LC6XyC5U
         +BAlJ2poXZ6iE0F1N/rb9o8unzIw6x2ncShRCt3rVxLjYh3IthaktdKdrBajPU/OH4W+
         vksTB79SrooLg6ggfALRccF4Li25li8FBNEGzdW285uwStwpScpyR8XZPz0je9R3tDJg
         pv/45/i+R0gJMbcaMjPKKKwYf4gj5SACIruDjRtUuz4TT7l4bcJHhPm8NgT13Ir6QgpV
         o5yA==
X-Gm-Message-State: AOJu0YyHY3p8+vb8HgwQufv+LF99f9SNeS9ECVtiZnz2Tuz+5Qyp5gc3
	1gOwo+yMhN2JiJnLmkVa585uLkbxH33fKneXrf/iYY8vh8lFsuqOwiShHG3kWD8=
X-Google-Smtp-Source: AGHT+IHVu9iBrdkkkgq+oanSyuWk5pt0e4V58k5SlYTmULii3Sdu3Gp9l3tagiGY3Gjuxx1SlBhGgg==
X-Received: by 2002:a2e:9958:0:b0:2d0:a8f6:c882 with SMTP id r24-20020a2e9958000000b002d0a8f6c882mr2456827ljj.42.1707232812015;
        Tue, 06 Feb 2024 07:20:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUwLA653clU15DlK9NIMq4RaBjxjUy1wiuWtski4FAmOO5NGL5Abxxx/EJ2Vr/tEQDYz6FZ1d7pn+XYl8AAHsPwD0n8P7EoIlK2DQywsZmf3vFJ8Upybe5Y4PzWdGi4cd9RICB3horY4KcRap21y0g5Hjmlnj5yw5CUdG9rff2rbgwzzeaDyVg1c9tDWrQeAXpJGw038Yybu+534ZRjUGwC17W2fJDMqUt+yLWyf0HxLR4YVjG7pw29ebFRAnyzS3n/yhz+xuqaRGJx3q8WQEocmyGmbp+eSbxxE/OnOkoIPkKeq1H04NjblKqBgQtEhu+EwM2EwvQrA/Rz/481UY6puAx5CRVQLzhKkRKTBc4FxXedcItqpw2DZivFCJfbpvfrgfLc8Dtb57L0CCZnntFaJUrGnlNjHGivPQ==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p8-20020a056402074800b0056022d78141sm1124432edy.56.2024.02.06.07.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:20:11 -0800 (PST)
Message-ID: <16bc6402-c60a-4857-a7e9-a60c3507c979@baylibre.com>
Date: Tue, 6 Feb 2024 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] drm/mediatek: dsi: Simplify with dev_err_probe and
 remove gotos
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_072021_295264_C17058A4 
X-CRM114-Status: UNSURE (   7.16  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Most of the functions that are called in the probe callback are
> devm managed, or all but mipi_dsi_host_register(): simplify the probe
> function's error paths with dev_err_probe() and remove the lonely
> instance of `goto err_unregister_host` by just directly calling the
> mipi_dsi_host_unregister() function in the devm_request_irq() error
> path, allowing to also remove the same label.

-- 
Regards,
Alexandre

