Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170ACD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93kdlN8ovTzTXzRKY8ZhtTjU1AdwpDyUxJFLtXVn6Vo=; b=tvXCNApC9XUBZhlaNXyJi6Zcoj
	vJfUcjny1/fDdxsnys9wI4MqIdIu+4q58SjDmY11dU6/gt3cVbsApFfBxFhcxXS4sDF32tiEvxNFz
	a2Bsu2f/dXHYdrCQsEeeOAtNvfZvaH0lquJiWXFvK5xZYa8lM5WYBrltqNJNwyqpjvyZeezBDn8r+
	/MkQIvugpBVIzTPCy2ZUixYalbYDoi1UJK6umfKq+jZDpZUFB79sVRac5gNCskt4or5B6d7USHRD8
	3LEOqLnk3rJhgqW/7OKyMoajqEfOvkm0cshjH6K/dHH2DZLLKI0zbf2qnBhz2/lmMBhZJrYEKad1O
	7nhz5LnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiADC-00EuN0-2U;
	Mon, 18 Sep 2023 09:06:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAD4-00EuKG-37;
	Mon, 18 Sep 2023 09:06:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D49E6607083;
	Mon, 18 Sep 2023 10:06:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695027985;
	bh=ZNtyNW62zjspEPudHJr6SXTUwT0rpU4X7UOJOlD7GTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LOt26kMneQp6FbI5o8wymzryUX7DiD9PSiZvDjEIEhiPdvMkZiMJOI+lFx7oItgps
	 ucWz2SKUjSu6uxApdpmimZCW+QYMXWzyRDie9BqkS7MQqvjomWWjTPai7XPsb9dz5H
	 GiEHOyRbPyaJeTiTypPO5sInn/gl0AlTZis2epJMGlFBS8qolN9Vd6agVHEXXgB8yc
	 S+xPNerFhya2VHxRRvu4+osKO+VUq/L3YVEfB0+dgHcHMQVEmUhWOSVazLM0oKYX2L
	 ifiowaQajQmZWP0Bd502j8FbmyFEidGLM7zZFmoWqb5aoeTe8c1lGK2qtFZZ/60mQE
	 ZZH80VTtUgS6w==
Message-ID: <d808df62-1cbf-dcb8-ad15-837dd2b715bb@collabora.com>
Date: Mon, 18 Sep 2023 11:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 01/11] soc: mediatek: Add register definitions for GCE
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918084207.23604-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_020627_132197_87AA757E 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 18/09/23 10:41, Hsiao Chien Sung ha scritto:
> Add register definitions for GCE so users can use them
> as a buffer to store data.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


