Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3BC61DBD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=; b=NpJs5RcAj8zVHN3DShaHERQLp9
	GIQwFny10WTacD9rMBwk1qhniNlIs0DSXkrw4jqyKfn0wjjgquZ0S4MDMZfBKZlIYW5Hclxg5I31p
	GfUPCmOucaLM/kmmTL8SoTHBGrlQIcekp2tqMgw0fZyEbe3LSTiLrBUu7pvCrdNOcx6nT/Tb6x7x+
	vOzZtleGJYUluQmmVcUGnUlQWhcLzFp2gNQ9ReG5uVwx3jWn2u8l6lKSfhZwQpxQ1sPeKgV3SnD+H
	GyH8VUa1BApFibW2P2rdDzZmnSbQNzMKHJ6rSvplXRXJIbI0UMEM89O6ur4zdrwUViHSImT0AOZiL
	5e1HyKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCqr-00000002RKP-0mAC;
	Wed, 26 Aug 2026 12:35:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCqm-00000002RJb-2dme
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Aug 2026 12:35:31 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso529932a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747727; x=1788352527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=VlV/cCPFeF7vbtvOpAFxlLXUmJKmm3bpx9TYrBW4+ZXoalZh/qLHHsVITXi3nB8vEl
         jmZzvtHJr/jNov3RM02UHXQEEKfnkQsbdne91eEfeR7Y8eq8scJ68ZDH8G3aHrq72NnB
         J3wq1LzzL8/lWzL8I7ODBUjed1/81dgTm9sKzvHZYvYEtZeUwOq7Cj/ISJYWvzaSwCVd
         vrt7s/NTVT2wt6T1uAF1jGgaEX11e+tckRDYPJ2GMZjF8gfE8O5CdTx3Cx71b/L4MPgP
         5dsa71oqMafEP56HpccuHiKcRyMbmFIifFK53VtXmPHu35E+LWeqrlIo/8B6NVTCtCdG
         niYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747727; x=1788352527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=pzkpIZaVy0Lw8xP1zIILYGHD2A9bwV80J1jECbfdNQ6tLXj2u0Ra7ArmKtHZiXgtj/
         e/1H+Ybu40OgV4HxnbQpCTxugf3kqg8mGDRc4DwyawQx3mUNafJX0OoqnaD60nbg0iHY
         /25l0Unb2NcjwJLLEYDlMJM8c4SNsSHjZMYfqbyflKmKNQma9ir9S9VTynK/emTltNZ4
         OcecaZTEUENJa0bG7Z8lHgNxdsXo1SyerO4giXbGD7Lo95Sw7+x0yp7taw08ELj/m/Y2
         C87SVXUeZJ1bKXCgirjual3WAfgfAFo8uWiG+5/vATEUOd8bTcSZu1zJKmpkNHHGM/Rm
         aULw==
X-Forwarded-Encrypted: i=1; AHgh+Rosi4StyQKWIG1AnCVkUv5Qao3LOG4uRFx5w0smfuxLqhs4BE2AZ5P1QQgzXmY61XefXMtom0hT+kMSurMZHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lVADgDL+tyNL5ffB4YE7DRUo+unPemoUMkcVJo/CoHr1hv/sei
	NlXSzh6IZdoSfTZAk+w1QccC6VrgNtue5QwMPIMqlBnyPwObaEGcKGpu
X-Gm-Gg: AR+sD106025Vt7LGZbEfEhtRhJwKVYJPIPq8weEw1znbE9BLjbAuJUOagZY2pyv+5DS
	oAC5+P99bdSi/NLYCGcd1BB7FF6qVZ8v0OBxqhao0Fv8a6Wao2IgwSQX+nJ3vLCkBK/wxXQDwws
	8sFVClzeON+sw6HwnsRL8IBYiLN/uujsQOYz+t8A9n6tjF2hXzeTwaFrF4F3zQncqdYQNVBRZ5z
	pMXaJwzIPILjoXG4mnPamCko0wXT8Ij02mGpMybK8lT5VwUNP1NYf0ZBSfTndVxOZ9jOxQ1He6B
	fUWD7F5D0+vlpspqgQAFzHdTRyqXQu7f+0Q2QCYCqEVxtThnm/dPXqYu56NMv0JQ3tS+0B+v7U1
	zEUIu8YUxAXpCtUFDnrJroda0YMDV8QrHlzl4HFYNDexZw6lxIB0MEqSTgA0jJgFqenicJvy+J4
	IHxgDR3naSztimY4Y/i91tFwN5XaCUdwQ3nanU5FuugKdA0IWNiLGDZqEGNrWOIoIagXj5qt9An
	VSAZttti2VUZ9mzcgZRGh3i6Az0eQ==
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr13609817a91.8.1787747726840;
        Wed, 26 Aug 2026 05:35:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm7925744c88.6.2026.08.26.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:35:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
Message-ID: <ao7dfxkXtbt9BybP@google.com>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053528_677264_D85759D4 
X-CRM114-Status: UNSURE (   9.52  )
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

On Fri, Aug 14, 2026 at 04:13:52PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry

