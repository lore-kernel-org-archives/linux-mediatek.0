Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D031EC55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=; b=SJHX28rIYXEmnuCGR8O8TGRiPE
	IZlppunxk84HLaP4Vd4PE8m4ICBLltrYsWEQael28LNRhOr1UJMv20W8DgLBMywk5duk4kO5rwBw6
	wlOgIHyFqueFMMjjKXI38cdnMvgPVI+tUPbFGB4QextIETBW9uJnsfyYj0UFQyJx2fFZ1fl4tdwss
	0dplmJ+U3WwLAhu6Op4srN72Y5BUDIzgpjHYofu/ftP/7CIbIa9dy39/8ZTYcxpzIyL/ciPdoML1L
	+DM4tt/EyGT/hgRJzJkDueoQaudDpF2pCGXOthxQ6jkz2I1wTONNHslihSxnK1LC5oYhjZjShFjAb
	Uox2wPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpB-0000000HPRo-3Xcc;
	Mon, 03 Aug 2026 14:39:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtp8-0000000HPQd-2Yja
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
	b=gIPgeP/bUTuNWfnBbPqTnQim+MKK4kZeKPqaYqr7CuNTh+0nI+OfwaEDKf8hCNZo3GyjCs
	ruAKnpp332GLgPsp4m9ZfE7Ld+hJhY64iZXRfxI0rxiOsNISRSOuTs50Ra5MfTZxPm0cTj
	bgRJ0btBUpMrUokJksQG9M5eoVrKS0A=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-iPG0hzwnMKGjuqbusq6Kow-1; Mon, 03 Aug 2026 10:39:23 -0400
X-MC-Unique: iPG0hzwnMKGjuqbusq6Kow-1
X-Mimecast-MFC-AGG-ID: iPG0hzwnMKGjuqbusq6Kow_1785767962
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81f64e9670eso128953077b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767962; x=1786372762;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
        b=KXboG7nsjP2N5nm6iw7F6zCoSZ/PLD2j08y4GJNeECAX5NWNIDQv1d8fW0UqLIFoUQ
         4sinunj9dtGOZ7UpSFQ297esQYwv7l+2b+83CzkDHT4IUnERgypwslOcMfQhQspEiUEb
         aeguD5UxJds7+xO+Adm2nwPGt2DvuO0j+93vw4nomF/Dbv7cSJXrfxBMhFTOp3EqVkFs
         eAZRUJwz3QfZf8eom+kWGnAs6NqZIg8jCWvAeMaXb/90d6a3tVpzXUczefk+UontgTkr
         PEb1hkEPqoHPbU42h7Q1gfiC8ty7NvnkdFT+KdPK6CJoouNIV7IPY3T4psp+f2Cg3sA6
         F7cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr766c4KcbkBOPPbA03nVAcrKzg1mJa47WIZfP+5NszokrDUq5Zmrw5B6tg6+7Ju7wCigsptJIGJvB9cLD7KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSrdO6+pIs3IluzDmVGErHjxrQHS92eDsNWR6VRlWva+5NaOtE
	02/c3HKUCjTgi5MwBittujHYFWIpqEYonDalcbwbCtzVpSV3yUGcb5qhwrMs14IdpEbZLJ9TIPL
	Fzr6eR8THYHsl9OuA9Lt2P0jYPsKzkglc4UeJQU0aBg16eONNN0I7dy4qjBTksNRcuprI5ewa3j
	ToNywtHw==
X-Gm-Gg: AR+sD11wBwokVbhsShRFzZgyZBqyK6nJlAP6JBIdo96aDXD/+1AaLM9jPKJ1jSvY6++
	7cmsZKbXkafSBXqMce6AZbfmpSQoygdUA/FS0+qPg2ptqnvHd47O78/2CUwqDeQgkI99JRW8m+U
	kuIyk8aMd/teaMoA3k9UI5Nt4gM5khFRjBM4wld45jPCaOYioUYVRj4PH8pPdL1re58VVCm2Z0k
	OUtejArwrX++qe2lovMe1Mu5Q7ftIk65E8tk9D61ShIl3LYGGcen/xdGR4kfnj8CimoapxfcWz9
	logdFAJ6JH49n/p6R/HvheNeWRj3UxX8fKqINniQpOB2N55A+yLUuTPygxxwaPQomgOzkB5prXP
	8l+lZqiBIp4E7l3XKtR+nI15nYOqSRi6o8TY=
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831847b3.18.1785767962452;
        Mon, 03 Aug 2026 07:39:22 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831257b3.18.1785767961867;
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf9555dsm57109317b3.20.2026.08.03.07.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:39:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 11/25] clk: mediatek: pll: Factorise pll power on/off
 sequences
Message-ID: <anCoF9SJ9nDHqaa5@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vHhqzmSM5lxd6rOcnQjvA9E5pSJQYWyZTCYM6voEI3g_1785767962
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073926_746286_BD1EAC8A 
X-CRM114-Status: GOOD (  10.61  )
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

On Sat, Aug 01, 2026 at 01:20:57PM +0200, Louis-Alexis Eyraud wrote:
> In order to prepare the MT8189 SoC support, that requires different
> registers to control PLL status and perform reset BAR, and so a
> different sets of clock operations, split the pll power on and off
> sequences from mtk_pll_prepare/unprepare functions into private
> subfunctions.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


