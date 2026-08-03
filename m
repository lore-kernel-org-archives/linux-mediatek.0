Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAC1C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=; b=cXvMZxep9FyWPR72gilhKPYozv
	NAG6C0e93a4wANkAJNO6YW+G/u5vy6loWbvsC9Y54cOQhxiNZOKZPGa4FHM3Dat9slvMkePdGzHy+
	SB1SflOMUUrk1K3INcmgWpR4DIj1k9YFM9V4h6IFS6Veh2yrAo+TXRAo/80nCkwN3EzBTfpjlMbhT
	vmh+fGsdo9ZUxDWfgSoy2iAHMbvyn8DS0OWhFhmIVnoGkJOs8V4v3MfCkh92ukRdfx/PRqYUskllU
	B6sUjkuTcLQTvlPC8TdU+cNBAqFOSMsZU0aBNhEZgEQD4fq8oyDZZOQ/2Jc7P7XMsk0p2vdcaf5I5
	s4aMW/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsQa-0000000H8G7-3bHL;
	Mon, 03 Aug 2026 13:10:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsQZ-0000000H8Fc-0xeR
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 13:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
	b=bneIQ5hv3ZFgY8ahwgMOLJwnVXj/wTrf8REp4X3EBAe1bKL0YygYeNLoFUSOjBLpOVDBir
	hnA5szmxvoljkrzPjTQgRVw7iowvRQMcA86opyPEt6Wqq24Mo9iEGNTt4kQnZ/AAhnPIrn
	W9q3Z4D1tuwGI/zKenmMOmU3VmsbccA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-wYxAsMCZNH-7GFgLvW7uIQ-1; Mon, 03 Aug 2026 09:09:55 -0400
X-MC-Unique: wYxAsMCZNH-7GFgLvW7uIQ-1
X-Mimecast-MFC-AGG-ID: wYxAsMCZNH-7GFgLvW7uIQ_1785762595
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e67e87752so31290137b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 06:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762594; x=1786367394;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=mcGeb+F19Lb5szvhpzuvpl8qCgphLJfja9txyfi1JHCbA+4gfrXwOVpoPRzkaWs49F
         l301KkfuUQ+wHxlwHWAsx+BYBxrg75VuxesxylbUrgQrwuQoBOVZpyh9copp0bGe4HaK
         IB6/YK536j6X4LHxfSArrpjtD4927eO4lRE0rFZfdIo8vhNe/Jvk5KW/X8LtdclM50dW
         Uv6RX9BFEjHZ8dd9oIiXORyRwVr5gTGiWtPep3KpgcRHXx3d+LTJGjRDmyon3v5ggnZX
         Xnr+q5ZqJW6a3KYjKKMHZqkmehs+wmaG5C0bbPaH4jZ1XOad4Yt0o2UQHzzevMMuk2dD
         YPiA==
X-Forwarded-Encrypted: i=1; AHgh+RqvaNBemo0KQAq9X7J1LMtvJ0EerlBtpytL/2sUOE1tQrx7AbgCOLDYJLb6qL0N8Zcy05UwEq+GG+U3/EGtgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3CSs/czm+y/4InQaS5X9/cpXHXwD7+r9TnLfi/WFIyzeeRbF
	uPA7UfW2jwvKohku5EoNEFFLpTHbH8VHz4FTpZdgKhJcv0wr/DbPjewiKlICQu5JvyHOd9mD9IT
	eQ0YkdAj7vOD5F1GhOTmitWeFm3zDGAAr9eGnHJyHscZa89Es+jZdbG3JS/esSarp4sWuXrSlZg
	==
X-Gm-Gg: AR+sD105UZwOhZyWVxdnmfVGJLO88LQcq1mCfdE0+XdxIaeDz66vfDtFQGw7rzEm8Ek
	LwYhtRfEiqRTLmnml02m8pWmaF9ynZFTonpdy/M9P5uczGy0VsijSJRf5lRRPw85dxVk+Rqy4Er
	ulBdWVZ80/HtO5v+94fUIdxg4e2qO7f9Kt4PPSOdzDBpQITS2BaINAnXKyQNTeCMFIytHcAEDTL
	4sZww7MwnxbW+fTjFYa1wO9vL0ORMOm1sihWdU1a6bMlFmELN25HC0ezC3U4APrbatI+TuU8yqV
	khEsUBszVjZpckKWn5D3ogtfWJmkhgHLOZASosdOr7ctY4gpDpsGLVcS0ebztlwhHpKVPaAEJ33
	Qr+wT7KIgMkPMj8E72aM6bgiEJDOcrc2qVUQ=
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127611257b3.5.1785762594632;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127610687b3.5.1785762594054;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm55024337b3.5.2026.08.03.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:53 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:09:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <anCTHhVjoymK6AiW@redhat.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GElWiEU1IK20SoxRemb0xGHl_pG4UdvQPymDJY1ymHM_1785762595
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060959_359526_59671C5F 
X-CRM114-Status: UNSURE (   8.94  )
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

On Sat, Aug 01, 2026 at 09:55:41PM +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


