Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F54AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrJt45b+9o4cSC3PsPeMV+26yeqHTb68J69gThNknyo=; b=haI2odtm/SpX0VHOnDXWNHib4I
	SC/+W3koGd6pzIwDdpNrGacIJGkdaXD5n4ZU7jIJSZy+3TvvLTPdl/rSFV2a9ZOmS4BybOmPapbRW
	9mfsGs719N5NoUK0B4zqolJ8r6ClB1aW68dlS3BiOFgHIuqN2cfrbt4xjUsrdiZN+0iNCtUjZ5s5o
	pfTt7xiUDo5AFPGIRvsRCzFQSpfIXRo1MGpSmRNYBtkiYoVrn5ayH7zVZhtX1ziZg8hnZmk2vzR7l
	SKDabAlBLEWinm1rycR47F+ZRCK3RaumiLeKGyPqRd9yC3Uytmxi4hgdL9s+tLpyQgZr9JSquUshD
	tlR3RT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQUV-00FiiX-BF; Fri, 14 Oct 2022 19:37:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQUK-00Fify-Va; Fri, 14 Oct 2022 19:36:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5CA41B8161D;
	Fri, 14 Oct 2022 19:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C745C433D6;
	Fri, 14 Oct 2022 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665776212;
	bh=eEjhidYj5VNDiYpsn0HCO9fjIL2iJoV/K1rtE5CgI+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hh6OMbuLYYkASYw11pxYoljgA2UiKs3kot9AoYNPCPFO8QRgzGmnX7Iqkub/mNvCp
	 /WH49y9IFDgsbYhBLm86ry6R7MuRi+fP5mIkqW0sBDUkEhO5TXea9chdhqroaA7aJC
	 gdFRcBmUSN+D8ToYTXW6/jCZf5ne/iIgSarYfptVWYlg1ZLCgFPQG8GrOs4vH498At
	 KuAjBhT/G+L0dDXV+5slII16jNcDOV+mLSHeHZBKpD7hrTQDz8NkTUMial/yZgOYcE
	 +KHv7H6DCLgeK8CKlMUPgvGGJ03d7fdWYvV2g9WgZckCrYRes7IDJRnxWYWb/jwIe+
	 fj/Uc/fEKrqgA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221012135619.wxyzuqheolhypoec@houat>
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com> <20221012085555.3nls7ja56vlnaz2w@houat> <c4a1eb9f-016d-c184-e494-c869038b87ff@collabora.com> <20221012094004.jgiyvmbgomiyedik@houat> <6e76f90f-3b6a-330d-6902-b31bf3d33ad4@collabora.com> <20221012114813.6d6adro746w5bd7c@houat> <decfd5e5-a48b-b2d1-f21b-1a4d52e05538@collabora.com> <20221012135619.wxyzuqheolhypoec@houat>
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Date: Fri, 14 Oct 2022 12:36:50 -0700
User-Agent: alot/0.10
Message-Id: <20221014193652.0C745C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_123657_200980_4EB418B4 
X-CRM114-Status: GOOD (  14.86  )
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

Quoting Maxime Ripard (2022-10-12 06:56:19)
>=20
> I think we need to address this in multiple ways:
>=20
> - If you have ftrace enabled on that platform, running with "tp_printk
>   trace_event=3Dclk:*" in the kernel command line on a failing kernel wou=
ld
>   be great, so that we can figure out what is happening exactly.
>=20
> - We really need to merge your patch above as well;
>=20
> - And, if we can, we should forbid to register a mux without a
>   determine_rate implementation. We have to take into account that some
>   muxes are going to be RO and won't need a determine_rate
>   implementation at all, but a clock with a set_parent and without a
>   determine_rate seems like a weird combination.
>=20

So should I apply this patch now on clk-next? Given this regression I'm
leaning towards not sending off the clk rate request this merge window
and letting it bake another cycle.

