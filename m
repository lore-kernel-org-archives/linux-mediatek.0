Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E33BC30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JySqkATRPlYLkNhd+lYESHv1lkNC/LIuMH3yqfbsSJ0=; b=gdwm9XJTSe6HXSMqxPhVRsIDXe
	92kKiPxkPtiZO9IjoUOTBMK2QX5eVur52gdMA9y57rlJs6jXKmBf5o0U0eoVyKBg7+SqNg/MEjHZA
	5vz+ngO8VkQe5f0dKSVBMtmq2YKP3Hi/RzR3srHly81K0eMiMQtWGOveB1eocavaUyY5DFIwz/YOE
	2ywYinXaCuFsr5MVolFnIhCQfVfSmavTJ+TB+0Jjn/G8CwfNt4z3bGHazgLgQSBzjd4IvCACn/XEW
	t5Jl0RIZ7NgWdh7pfJS8aasfSEhNZq0fh6WN4TmydP+wwUTRbNb4E9sB0dyfxxhYBDVZVwXFmlJj0
	aixZMBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0Og-00000001vRw-05w1;
	Tue, 25 Jun 2024 07:15:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0OZ-00000001vQ9-1bar;
	Tue, 25 Jun 2024 07:15:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-364b2f92388so3764118f8f.2;
        Tue, 25 Jun 2024 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719299713; x=1719904513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JySqkATRPlYLkNhd+lYESHv1lkNC/LIuMH3yqfbsSJ0=;
        b=RZVn6vdTIYdvuMj9cVzwgEAvwHtC3dajPZDaxK9bWb43Lja5SucHmfPw/ef08IMZK1
         M1d+5Jrnbw7X8OA9SRuCeTegFSxSDOwdI7wtx0K0OCtwur+fopfKpxhCW+oGPpoijoQh
         /zO3kNats2hRcamECn3BIl8/+0JB7z5t9PYg68VJMucGksAdO8oOAQ+AM3FX6gPcqHeu
         BtOtvaGjHOhJo1U9Cn4xnwkZpZnfZlbcgP5OsxhX2p6g0TU7mMdVxhrUNh+m6jOgvect
         ANAXy4SUodHB6bMftRPAoANbHVkvTbrDhxp6OOnk1aQFsjBztq0IUpfY9w5QyM+rH5mD
         IH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719299713; x=1719904513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JySqkATRPlYLkNhd+lYESHv1lkNC/LIuMH3yqfbsSJ0=;
        b=BCQspXE9b3ttu8qXOVexDusDWmcZVglNifzAPowmJIILRMahu6R1nJa2aeGiREyZtB
         +3uQrvwclndA/dvY7MjEc7FMP9fDF3YnO5JPlTdj7yBh4XJNXGpp8Dx1qSMLW1PDRzzo
         PT7AwTf09HvCDZe3ldoVBTnw1iDONDU1dTtyZTFQTcfuvdhMUcaxcH2tdMc03vKOxvIP
         Toh/DVPvSQvWZenlmwmY4kgbpQr2LXsMWwe9P9ASx7PEmUSgMqrjsd/IVipo/zyDtWLj
         4DqDZNxGctjR8le7drmz/czTVBrRHUJIaiL/3CpSunA4OnXNn5NacG79YrK+siCSNLQR
         uNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbaDpHXQUQCR99luYOJwCaIz66mxNFU8tZsmWbbudq2l2lxALTJ2oAju+wb9FwsVAmnM52G4AjB0iyFVUPGyMa6GEjLRrwv1qvOo1MTYRhK4RpuTS98dH5jYZ5dZv4ryti8It9jN7Dp42oX/GcMMgCWIqCM0yU3jw=
X-Gm-Message-State: AOJu0Yz1VYcFqliD8bnYZgI9UXzXHGy4/8SPL3mUTkgmfODN6WQPwBlp
	YQd2tUuXi4O763BZX39jxJsh4XBYMvWWfb+/C4xHP9V5Iiq5AQhc
X-Google-Smtp-Source: AGHT+IEEbVK4uKqf4sQIA/jL4J3G03Si2HpSOHfkFWkWR7fwfWJ3/XR56egnedWU+oaQoTsc42xjlQ==
X-Received: by 2002:adf:e649:0:b0:35f:119a:14c7 with SMTP id ffacd0b85a97d-366e965ff49mr4161102f8f.69.1719299712727;
        Tue, 25 Jun 2024 00:15:12 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada128dsm12110656f8f.117.2024.06.25.00.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:15:11 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:15:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2] dt-bindings: net: dsa: mediatek,mt7530: Minor wording
 fixes
Message-ID: <20240625071509.pwo4qmnvlf4ooqez@skbuf>
References: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
 <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
 <20240624211858.1990601-1-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_001515_442882_82812CFE 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, Jun 25, 2024 at 09:18:57AM +1200, Chris Packham wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

