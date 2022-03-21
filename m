Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 04:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEHs9iY9CZJsBNWnxkPkDom8IB0yFqC7lOa7a69vt2I=; b=fPw1O+haYlGTtl
	TvbuwICBvB+5lEMYVrXOW+iwH+UCJ7QTVcft24UAvSlss4D+BurlaPyOo4MmQ6WhLygj3xfuqT4Ix
	GE06z+IcWPdOs5tQdbbUjSy/wVjP4HEDMFVyNp9ew7sFNjsBMpR2fV0Y+1c5DJQ4C+uxKS0kb9dYs
	eQDLm/qfy/oNsSma8z1BvaIrrcabCxjY94gXtQo/3RjETPYEHYKL4pgd3w2wP3StWXqNpfgHV5ctn
	0iZhm9B5tFOZUcRYWiYKKQ766omCT8M1e1RRIN6FgvdYhmMG+lmiOK78KN9V+Uo15+wIYSpqva2nY
	s/sN9E6z2ynz36skCUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW9DP-006QI4-J5; Mon, 21 Mar 2022 04:00:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW9DB-006QBI-MI; Mon, 21 Mar 2022 04:00:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2842BB80976;
 Mon, 21 Mar 2022 04:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48308C340E8;
 Mon, 21 Mar 2022 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647835199;
 bh=rcfrMRNmcGIva2FzJ8WXEWjgFGNXQHRVjZF1XPtl/r0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jRcKMSnHJ9F9XnbMGSSUgxWHnYrGWbB6zbWYOuqt9C/JhMOPTNUf/PpxSrPqKGrX0
 Nzewz1gbzoDa6ZiRiJk5GEv9s0dfICawGiauzSgQ7+qvkaYfEdhKnwCk1zRkDg/cBh
 N9udM8kaZwU430q4Fsmxv8EinXUtViPTKJVvfoH5SO+2XW4zjfCyzpmfLlNqpOgt7p
 UICdAwfcN0HeUvXYVGmPhuzlqQXObqdZs4+MU0jwUzEXlGZCcQOda84d+uwsIoUIeA
 /FNE3mByRgKe+LKYfnwcaMCoQ+ix2aGv0aBNOmFwPXAVElb598UXzSx9YMrK86BND4
 se7eaUbgIc9xA==
Date: Mon, 21 Mar 2022 11:59:54 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v5 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <Yjf4Ogkr4MPzS0vr@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-5-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-5-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_210005_882559_2E468941 
X-CRM114-Status: UNSURE (   8.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 19, 2022 at 07:41:11PM +0800, Jiaxin Yu wrote:
> To support machine that only choose one of the rt5682s and rt5682 as
> headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
> Meanwhile, using macros to simplifies card name and compatible name.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
