Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C13C982EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 19:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=; b=c/4GJFELBJHjdtBcxo+2sLUZ5L
	8ThYUj10CJQ+6eKiG/CIxWJVB+eioYfg0BmAtGOTNIIRyVGq2NF4DUuXnuDDerYsLyqPZCYoQzWsQ
	f6QB8opvGKLzancGT4CJORFZBR/qoft/w4HHEbMxBaaC2BFMidpIgppLNw9PBOGMiTcCsQqgoYjsd
	baKAlVdC14rvkLYH8Txd+tS1sw9dbnM+i0YUr4h1wDLJ+XOOAd7XDReA7bbcKZcVuQ9IU5ZbWH8LY
	r/ebARh0ojvYeMi0nMsKT7nf+dzJrQoR6iRsu3UdZ4fJe0GVluWsVDa/PDSuj4JR5lFXS/l9I6SDx
	O0/ZoR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jkJ-00000003Eks-1Uwk;
	Mon, 21 Sep 2026 19:32:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jkG-00000003Ek1-2c7v
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 19:32:10 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d90ba1d807so41162815ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790019128; x=1790623928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=g1wc6gHPd1ObszXXwlQBvbh9jUrtBPDasWzWTgqhDgT35CfP6fCtc+QHQUPsMOIfyk
         vBJq30+Un/p2iiruCQWeB8bSa9SLCrzSgvVGlO9Gb+xAQ5OZo0VM/DSfVoTTebUwGH5R
         58VKGamx6CQkueRP2R012RfXMCZpY3EouSNhTMjCTo05CBeuxEuLcKFrWIE2/rFVqEfW
         KgoRrcdq/6qDUmc0DkUv2+ivTewu9mQZHb7bzxZCW4IRsHiIVzlUYG7pWlVidmVb/e0g
         W6jupeOPfnJM24HzE2iyE6LBhkEr7zW6s4KoQH9PxElh8sEzhm97Y+pGj4pR89wv18Kl
         yj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019128; x=1790623928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=U8gkQCeyrYGwCUXFcAv0E4qJ+AJzSwxWlE5g5YkKjlTuiyMuf85rzGOPo5qa1Wa1/j
         XagRVYKRNC3mGH9AHtbs80bRlUtJ514E7gWyH2fAq4M1KpLM78+xpkeY7LsGCPi8bfUM
         pZ27kC49/xMr383dGQDrMpNyNndK3r0nolWWs4ZlUo7wu9PtFEKbUM0tl8gkNvSSWVC7
         Bn5uLTEy9OSYOYncizy/iweZNFk09vNRL+e202SvG5YXykaVGpTcFstOcViaDDkzzSRq
         HddybPXR88sAp4jQSGcG/RKVcvwAFvS3ik8rHQaucaHlH/via6NQnk6gL6NI91nFHlQX
         fbug==
X-Forwarded-Encrypted: i=1; AKwUvBxsi/1+zLdLCax02wP1mYFq6UO4jzv1HYf+bl7YBdJeKzGuowxFl2AoLj5VZzy4zcndgkP7ErgIRJ908JMhyg==@lists.infradead.org
X-Gm-Message-State: AFuF++kZMXWgRPE34zQ6r758IVAFZvW4pLpnbC2drQpb7oTdGlewOpFS
	QjfGMCd8D74lenscLjDAdQjZ2xodLKU60UmEDNCtxxj9IeRpAUjw5FlS
X-Gm-Gg: AYBFou3BOcMsIfpL3nblVDbafd3LwyGF2xgAO1zaHQQ/+tMomx+GH7n4FlUsSn8u0fy
	3GXAdpAyVITav2BO9TehZUlfeXQBDtqUWh6gD8kIEL4GWot22N0zfWoNgaWdR0dId6CncdlOCyT
	oXR86oJbGvcmzFt37YCI9vwNe4x0f5IlUME4415nwaI3xmMLIUTVfmVgrBye+6pdav0D+Kr0aI8
	nXCDxEity4nSelfHIZFGui4Ys0mXeO0y3rtqvlvgM3bTpZJJlHB+FWRR1oSWDX8VTaG3FVfG7Sa
	bqL1O9FCAqgybRXkCAPTeZdv1aW1t+tlx8mqTrSa4C3jWQ30lJViJ0JhOK7IfCxM55aghswQLzV
	p+8wfT6JfmbuCALy4yQdiuwWWZnsNX+xVJlhizdnodI6Qk6tTvEjVCoNPUb0FuZhucWpftYxJZH
	ltIvrTdCbSggaRMPnfGs5tMucKJRyXCUagw1n9ArwMZ+udZxaVkyyveNaQnbiNFNxC/IH+RhYO9
	j7qgiltoHINLBF4jfaPoILYHXcUNzNdIeOS81LY
X-Received: by 2002:a17:903:4b28:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2ddc100a676mr100940305ad.46.1790019127634;
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec60d1fsm126954eec.28.2026.09.21.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Frank Li <Frank.Li@nxp.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
Message-ID: <arGGLo9vmxyJQlTo@google.com>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123208_673561_EC176A77 
X-CRM114-Status: UNSURE (   9.11  )
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

On Sun, Sep 13, 2026 at 02:33:11PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry

