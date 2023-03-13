Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F572C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNZm7BF1ODafgReuskP+IS2SkYTX3gtgFqvZ/7EdkYo=; b=nYViL4gjCeUeqWXRbn0upVm/qq
	N7MwbDpuP07nXbiQsTKw5mAssmkSdlyS4ffLcjqiZgzLUoaRx+RquqYUbB14TAY5kCKmwpJVWx36B
	weiNsaJLNil9Dg9EsoP5phBOiMi+ybvHz9YoZ4ypfNvXbuJfW5vi3XB9/ldk0nELYRuoY2y1G9NF6
	azIXnFCBYblm9qpgdbqPzHIYBZ6zqmelcQ3qq1oowgdXlSziwIjKd1RONdr4LWkUEvz7bSXQ8F8V/
	woxbAzI1RW2EygjjNnTsCM2IJSwZ2QlKF/j2YDuao/UD8O45uEWnaTTZO786zNSW+uu7DSzl4RlRH
	g8g/xMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnDb-007MgB-6R; Mon, 13 Mar 2023 18:48:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCx-007MKB-Fo; Mon, 13 Mar 2023 18:47:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A74566147F;
	Mon, 13 Mar 2023 18:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610B1C433B0;
	Mon, 13 Mar 2023 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733261;
	bh=KNZm7BF1ODafgReuskP+IS2SkYTX3gtgFqvZ/7EdkYo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LFalRcQc24xar7l0NpoULgI9kgyJ6yOXKYI1svfUl47FuvmUPkZsVCc4GpBGN6EHi
	 GidjYPM5QtOIcRN8a5HrfGx9mA+EsxotR490GD3FcTWIozuIHLaCRrX0OSGT5q419t
	 gakKkb45n1HQesFJkv/Z9UKcCWkSKYmx/TR45hceZjZx9WswHb4VPNglGygbFGLxWZ
	 z574PRl+OmdnssuNu3g3sJzpDmIA38kI3LwwjBJhQFrJA1TE535tnrQ+0vYgZdTC3I
	 A7lVLNmrQ59MDZxI44AL7aXW06EppXplupssT+eDnG+TGsgHYXdvZZsR/JhTyTgV/x
	 JuWBEKCEAIM9Q==
Message-ID: <bb73082166b0c28d15035da36b629642.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-6-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-6-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 5/7] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:39 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114743_596566_C2DBDFCB 
X-CRM114-Status: UNSURE (   7.94  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:03)
> Add FHCTL parameters and register PLLs through FHCTL to add support
> for frequency hopping and SSC. FHCTL will be enabled only on PLLs
> specified in devicetree.
>=20
> This commit brings functional changes only upon addition of
> devicetree configuration.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

