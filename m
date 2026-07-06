Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FF6C43602
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=; b=sE+BnyOacqinoLZgdIB340faIw
	p0lsHaOrcOXh1e2vwAFDYsCzbD5fqkSy59UwtUS+q9nOcNQNaJdn+IELqwdZSnCYNHpbj10lkLStS
	ZYzwA+NYGrj/56OSQaBDvvJ9PyjfgqP940Vml7IAYFEaKC0r0RLNV2U8v5J311v0ii8q454ZK2hpC
	UEA6GMM+mQEQQf71YYkrqQSaLOB5MWg2NXpLFlrwgvPaxw+rorH8Ws/hfXGkCtFoFD+ow6+BfoipE
	RyJ9+n7Z8rkW8btkp7L4zH4cEDZmPOF9yNmXG3Ytd20dNNz/JrXgUgZqvN9AtNPlUXFk6yCneSmjo
	s2OIrfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglO6-0000000CuZE-3unP;
	Mon, 06 Jul 2026 15:37:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglO4-0000000CuXu-0ar0
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
	b=hDDEZheDirMC9uucDa+FC18uRNguaseZFltUZnkgKiSxXsi5ljnJ9htCCEjcd/6whrfWzb
	Anmmuj+reig0GV13mELRUeQZraANWm14xjHCtHBOsVKz0WVfvgne9oQDTRWEfAj4VqbKnd
	KfeMIlOrv/jKHCfH0KmZq1UTht9o4XY=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-8zgyxIuQPkS-jy_IQj3ErQ-1; Mon, 06 Jul 2026 11:37:34 -0400
X-MC-Unique: 8zgyxIuQPkS-jy_IQj3ErQ-1
X-Mimecast-MFC-AGG-ID: 8zgyxIuQPkS-jy_IQj3ErQ_1783352253
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667648adacdso1974278d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352253; x=1783957053;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
        b=WLI8UpehjGH+/C7udoT4n5VQzCjW6fyp8yeVnd6UxRSZgSWc0WWHFjal1jO2jBymcI
         di1vcIW7vLs39Lgv7kxOInjOHbalScTzNXowhkU6IYi/lQh+7vcnibHIHdFBnc01kbXt
         nriLc93ybkoI73zIj4MJxHLvFEDU9WBEaCExquxdcdGm565RCuqM6EyVIfLJYm/EUTFV
         HTQ4nD8/4Ebm7LEZG+jvZkRDbDC67I9HE7qBbGCSlc7kzxvHGUlDfziOXwYtsp3mRoc0
         tIQGVpWqoidzrELst/+TwLpdw8ApeMiOeazlI7Sh2n3zWZzV5cCxCbu3MzWSrHrALBks
         5tAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPsxiVLhhh4PS0zSlmH3ApScp4VUcJHB4yR1E2CFyi2x3FV6IPm8LK719HQhdAf75SFRH0dtDVdkq36KUmRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8KhOYe8lBzBUscuswI4j8DBJ5bj4Cc4ZI3Cy5LGzwmH4Jg4F
	lm0SWD7vrNMKTTDkPSRCzvWC2IiWY9zJbA5d52QRvqZ5LPc/iAo+i10wseSq8W0qc31C/NOgPKy
	CWoCJwDJy7AGGaqFBTJA+FEiApK2hDmXscGUwQLps/4DH/QMVySGUojQaBgAmjRfy+LLhaq/U9g
	==
X-Gm-Gg: AfdE7cmCwO3OurcCDjKZHlN5+q95F5Dffy2lbJV3zB7Vb4A4sGwI3V7b8gjtu3eCJEt
	USuzHTE0dFU9mA0fWZb/P/NHokIhNVEUqDgpYMQe0Q/o8SiTqclIK5O+i560f3Pqf8L39j1h9ss
	LlkI+nPdGUhAUplitsj19P0BtuaaRcexUOB4UhFFfXeQ6lK7A5vb+tncDZJ/5Bj7ipurvJtF5mL
	OCzmWr5Ep9yL6/PIX/GsH9c+KrVMNpTJdmmWUqOdVFlONBxIu9NLddw/EMm/M4CSU/8j/T/Lkp0
	97K/VJ/LZH/13RMlW0/26AjSqHzja8AIbLB7p41NNZyz0w+GFn7Co+lFW8UzhG6/vutcq/Ln3+E
	4kNAt9sG7+J+z78+sdW8m05ZSQA6g6VqBpNpF2w1aEfo88w==
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832914d50.51.1783352251789;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832885d50.51.1783352251259;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66640402ec3sm4964158d50.5.2026.07.06.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:37:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <akvLuLVq5SmaNro2@redhat.com>
References: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7u2kHy8DtODCcNMTmU8ubOtZX2P1GX1I8eX0bQZ2PQ_1783352253
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083736_263972_6B8E2F10 
X-CRM114-Status: UNSURE (   9.38  )
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

On Sun, Jul 05, 2026 at 06:35:24PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


