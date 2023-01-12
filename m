Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE83BC61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NJdEdDeYM0iYF/rhrS0Bk/9VHdHQmGqWaF1zj+N3Qg=; b=nlrXTcHEASB5gSq6ptPmylVJsi
	QiWg0J6xBj8ac51OdXIt1TRIS3MFPoFh9jQCEsAyzw3mbQwM9kyk+ychMdLkjKE4DU9hzXNmxpUcz
	1dM0/QHR0kpe7AfkYb3uc9X6VoZ8vfL5qA2EIY1PnsGZshkEZld6OzzWiD+GZ35eIZ46f9eYGhC0g
	e1kkKAfHM4iQZdJuNyWb1+Dd4tZAV7CI7NeFfIi0kwXXuFZoHOoafqUFj6Dz2NONXaoxgPwEIeLF+
	pQ89iDF9UFUb3FSw+PDwxVYAW1u5QhF1en1z5xgEMbwBPJwW41Pi5MHK5Hhi+s1ZHIe3gvOtNq+kp
	YfIiv9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1a0-00G42W-KL; Thu, 12 Jan 2023 17:41:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG1Zo-00G3z4-60; Thu, 12 Jan 2023 17:41:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CC19620CE;
	Thu, 12 Jan 2023 17:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA97C433D2;
	Thu, 12 Jan 2023 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673545279;
	bh=59i5RgEf1vjXvEXQpowOJVYe9y3HVOOG3D5NVnGGkXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDMhLduh5yDA2wwL6jmhnYwyhN5A6/f/TzweizgNgG1/Zo7NXfxvIt/6lhPdNQSBc
	 fChT+HpoypfM1OJWHvLJJnyPusQ2SLWvojokWbDdo7PUnVGqZ9L5/4qVyrI6wU9GFd
	 Gb14h68BiWU+ZiLmyiHynkdv1U6vGOlNg+pdxzjMSGBQDEM4OW7SDuJCcdldf8oihw
	 DeZ647wGfJutTUnZmYT9TteX4IaDiG6LO43+91Aze7jHTwx0JkUT6yion4JqlvY+OX
	 u3W7gwN6b+J3pC6yKEabIflA3h5tt882EBy5y7rxqDpyUG6YTtuVxcf7y2xNEFQE8M
	 blKK1hH6CQEMQ==
Date: Thu, 12 Jan 2023 23:11:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v9 1/5] dt-bindings: phy: mediatek,tphy: add support for
 mt7986
Message-ID: <Y8BGO7A8hxAV57tp@matsya>
References: <20230106152845.88717-1-linux@fw-web.de>
 <20230106152845.88717-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106152845.88717-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_094120_277345_9AD63F30 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06-01-23, 16:28, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.

Applied, thanks

-- 
~Vinod

