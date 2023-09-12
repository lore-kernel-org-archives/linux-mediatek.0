Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E2ACA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcbiJE5H9x9w2RMSxccKErTOx1sNYL3mxy44B/YsJa0=; b=xZVoFtuEPMbcS00Y2hXG7oI+AH
	W3zjkzp32rAJokSHFSdIhVQXvaUNUB/UJ22gzM3iWbib956bxPB9vnnZxDHXvfcQO3dRm72QlbYhx
	okli8I96UzqSjZdwSJChEtn8FUNhomw8agReArqVXPBQ7JkryVSxtupwTgCmEGrc3HA4Lq0RRylAp
	/4pv+BvOkKOK9P/8vkrOIBgxmppQUCfTocRyMeuKTQmmv2XF90xdkgsgZxlmpBng9hxjqhk37K8m1
	XOWdQYvoMtYcGYYW03vJuWeKHEeuiNMnZuab6ySDII+pkpN62YUDBqWyGw3D6ssWhr18q663szU5k
	q5XY0lyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5mK-003lZS-0x;
	Tue, 12 Sep 2023 15:58:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5mG-003lXN-06;
	Tue, 12 Sep 2023 15:58:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DD05FCE10DC;
	Tue, 12 Sep 2023 15:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35FEC433C7;
	Tue, 12 Sep 2023 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694534283;
	bh=W25BEEGerwOTf/J7Thrt0eHJlBpjW1DTVZWcJFBtBFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QI91A9yQeV7B2QdHq2e+5HwP5jS+fD7SJz20BmvT2TQXUhYYGFyEf9gA0HRaZ+1UE
	 d+OejMSWvCw9WQxsre/kZzndiDUZg8n9C1puLqWC5CNSYMy5RNPFR8XGUGRuJtv2Kz
	 pQLxbXtEIrecy6uPgkAooT2BQLI1AZ7Awz1+Dr3WCyJiyJx8DcY6NrYT1qu3MM8762
	 EoSUVWaroRUWW+hI72+DhPk17sl8cxuzv9EQzV9Xr7PNfLT+wDNQ0kh4r2G5Ccwa1X
	 JMQ6HpVTEJ/UluKi1tRS5sXOEvDa89oi8uPjUJEflCSjA9yLj8g7eFH9dmIwCJARWA
	 C63xoSk9EiTEQ==
Received: (nullmailer pid 859269 invoked by uid 1000);
	Tue, 12 Sep 2023 15:58:00 -0000
Date: Tue, 12 Sep 2023 10:58:00 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v1 1/3] dt-bindings: thermal: mediatek: add mt7988
 compatible
Message-ID: <169453428010.859206.8089094622420685827.robh@kernel.org>
References: <20230911183354.11487-1-linux@fw-web.de>
 <20230911183354.11487-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911183354.11487-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_085812_249223_64B7A3E2 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 11 Sep 2023 20:33:52 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


