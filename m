Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FFCC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=; b=cRkg2M8xYCx3AnnqZxDh2PmZG5
	0EXYJ2Mz+A8QQWEXIahaVy4QHXJqOIQopVA4+WXmVpbAGzfRdlSJHLL78hUuHYE7ao5p2x6+jUXlA
	uDa6gsxOTnc+UJorqUX2kS9aXOdIyUF/cJP82AYH8mvIZuBYQkd5H7WyW0z01ezb7igUNu9M1OZrQ
	Z41cCjTa/GhbT5zKZrNkjVXYu9Va9Que7hJqSZnHwF1/lyQoDfd3U6zyL7YvbPJIHL63SRbERoOUn
	VMRrdX0K1+5j7j2LkdUllnSNubUcpI7XTWtX0cRBL3Vxp5HylFLdUeijNtH5DPbh2AtUxxbDkHZbz
	ZI8iunBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFWA-0000000HTRR-0vB2;
	Tue, 23 Apr 2024 12:45:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVE-0000000HSci-1Fis
	for linux-mediatek@bombadil.infradead.org;
	Tue, 23 Apr 2024 12:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=; b=His4cW3FcNP82ArD7RU+Qj1Fi8
	Atx2dXhhmeFQ5v5GbZkvPIL8ssGbZ2yO8Qly9vxChaInjFN7v6zzw+bbfiEcjqzccOz9nOKe0DVLe
	hkuq3/8sOEp4dFehwmbs679n1sjwCFB5YTWHVb2JKU54hn5jcSG67JoIpgBDOWT793oZYmm67sB44
	jBriHsPddaoXDuQD7feUbXI0iAyA3oln7l9htlcMaCd3h1fNBJEEnkNFvqWsS/7sLyHjeipkUg8Gm
	MHlgDomWHxGGG11To8+ZFdLy/5OFJVe5C10G/3MU+1lQRSFmLrVcvIvuVuTn89wRU6oUVVy51IIxP
	J4Q2/7mw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV9-0000000E1zw-3C0F
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 12:44:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3476dcd9c46so4226802f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876232; x=1714481032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=f+RJEq9sMNPjy8lw04VZ4rSrk41opytRN+5MrQJ/Z0hCtym5PoH/YEzwoMRYKX2/Nk
         PqQnVt4ezYcLa4FYfQTRfifBlCHqMa4B0dh63JTfqCw9KmbLlqBnjO0wVzJKAix0hhj0
         aVz2EEvIJzF2ASn81+PIFgbd2NIlFo8NapSJLOtpNc/rG3wWX5xzyjflns3rzBwDKs5O
         8dLrSRXi0MeyRGUJccG0AkiO5V8O6YJAKCT+8EH2g8iseEx3V30/Azpr3DyEu2P3d7V4
         OYe1m4wYNiU1IMr9RmVW1y+z6IpPrwmjReZ0cBzXdgGTomB49yVHvP7CKnWHsJWqyn8U
         EW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876232; x=1714481032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
        b=sDYXXiwYUGug8mhNwwRBcuvABc5/RJwfOenJ4FaS3ofP/jxtPtkxWNa/N0QcVgnj3i
         IIb2JHrjWddZjoZvP4fYkdHCbe+SRJvKorUutuX28S7jtm1uIDSZTes9uTIelPVQ9V+4
         SY8xfCB6UhrgbfUkgX4BzH3FQREa8V9Qvpubx4ID34YUx5vSZbbacBz1HvCghZVHV2/S
         0mHOpuXalw6QbTR6p+rH7b8Kl767vykiASJsw7VUTr3n4foTAoDvaZeV8VV+3fUpfMr6
         IvesfFJgb3W0Any34VB9K6nk1r79uTI02KP0Alo8wusfYDu9yxnZtgAHRxu7m0LS+19w
         9zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkTJGjkk12Z7eE32JTi8xX9IjpMi/qp9A4vgJEGZqbuqjSllkc05j6Tkrc0FZwAz6V2+wvICjCq6VqL6d4QqI9MG67Jd6geHXMx6zCEUiv64Kj
X-Gm-Message-State: AOJu0Yy7HHN5YsYOG3QPpEqSWxeKdn+/8IGefqkCzcUeK9h/rG44GGzf
	N86XPTqGGwP7n7AhyRMK5KgOxt0gaAhVNEGLtB0JTrj9h7JzdR0Pd/Vc3mmLL3w=
X-Google-Smtp-Source: AGHT+IHx5NN+z23VludiFeHTrKmrJCe4gLG+r1lTx6C4j7QEMysWQLMdtEpvLnQqAlOL1NQMbBj3Zg==
X-Received: by 2002:a5d:6a8d:0:b0:34b:5caf:6342 with SMTP id s13-20020a5d6a8d000000b0034b5caf6342mr2073298wru.67.1713876232556;
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d6950000000b003477d26736dsm14506412wrw.94.2024.04.23.05.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Message-ID: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Date: Tue, 23 Apr 2024 13:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_134400_638329_CB5CDB82 
X-CRM114-Status: UNSURE (   9.84  )
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of num_channels.
> 
> Found by cocci:
> drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Hmm, that commit log needs more detail.

"Convert from atomic_t to refcount_t because refcount_t has memory 
ordering guarantees which atomic does not, hence the WARNING for the 
free after the atomic dec."

Something like that.

I'll leave it up to yourself to decide if this warrants a Fixes:

I don't think so myself because the previous code doesn't seem to matter 
to the decrement and free.

---
bod

