Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB21C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfmpun9Uz4LGgqYpH+kpJPvqtCezhxJAG3MPoysnhjE=; b=kFZ97XEph6SGJTgKEsj71r+9Gw
	+bTaVS8yS6atHiIHXmFaNYVub4H3+WyenALxio6R/MHolQcNiHqz2HqWmi7GvAbX6xv39v9RV+imB
	OqY+dQDqSd+gAJ/uEgimJSUQGSz9ALbNNPWfeewi7f69xDWD5fO7xDKEDx3oAQdjvPNbFC0ytFUih
	OHMQNomP8QSkYnAY8ru19FgUlliopYsqKWsdEd2/COmc4Q0AjKEFFND3nshmeErwyMDOOyVfY9MxF
	Sm27POX/4mCQMj6/DSLNvwa3KA8l/gEtTei0sYrld2PpWaD6LcMRadNOOuWt1pSopriOdL56qjR55
	PzABrErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjg6f-00000001gnI-2h7E;
	Mon, 11 Mar 2024 13:54:21 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjg6b-00000001gkA-3MSG;
	Mon, 11 Mar 2024 13:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710165253;
	bh=teFg2HfjlhBa/0gCJJYb2mjJeW6F9dWs3JYVo56bMdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4vIxYE71aIbuFjJXlBEpf8zMCx63GovGRmWPLlpJ+Qkbxq1qfEIBmPpppIEZ/uu0s
	 Ro3LgG8cHIZKx5mZ3RXZN13qHECNIMbdrZq66uCbMD8oFJ8AgIdT3G4STcUfiV1nKz
	 uaZfVoxoYLHGLfN3IkT2Uh0uE3stt8jMtvEVJR98+U9/7nxD06fNyYVl0H9GgAD151
	 5IyApVlO597zycgi19NsoIlfBZTkaVBI8vQ9Ghxj1ywGk4kiOmxWp7yIlZWJ6Zj9Z2
	 9wUeDCCRxCYxPHwUQn+2UH9YMfZe3DHsHQ4lVceaT0C8CSuVzekxK44ZvrdK7xJGlx
	 3Rq+lZn7gSTjw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 16E453780894;
	Mon, 11 Mar 2024 13:54:11 +0000 (UTC)
Date: Mon, 11 Mar 2024 09:54:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>, regressions@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: Probe regression of efuse@11f10000 on
 mt8183-kukui-jacuzzi-juniper-sku16 running next-20240202
Message-ID: <82c0c04c-ccea-4839-80dc-16bcf6794bf3@notapiano>
References: <47cdeac1-121d-4b1a-a3ac-e2affc7a2fc3@notapiano>
 <c4416256-eedc-4c9b-b968-3a02490c4c09@notapiano>
 <b888cbe2-6071-4445-91cd-8ce7cc9cc8f4@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b888cbe2-6071-4445-91cd-8ce7cc9cc8f4@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_065418_010404_A61E3363 
X-CRM114-Status: GOOD (  26.33  )
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

On Sat, Mar 09, 2024 at 03:06:38PM +0100, Thorsten Leemhuis wrote:
> On 08.03.24 15:31, Nícolas F. R. A. Prado wrote:
> > On Tue, Feb 06, 2024 at 11:11:00AM -0500, Nícolas F. R. A. Prado wrote:
> >>
> >> KernelCI has identified a regression [1] on the
> >> mt8183-kukui-jacuzzi-juniper-sku16 machine running on next-20240202 compared to
> >> next-20240118:
> >>
> >> #regzbot introduced next-20240118..next-20240202
> > 
> > Not sure why this got filed by regzbot under the mainline tab rather than next.
> > Maybe it was the missing collon? 
> 
> No, I guess that is a bug in regzbot: the support for -next is there,
> but not much tested. Will need to take a closer look, will do so in the
> next few days.

Ah ok, that's good to know.

> 
> > In any case, the fix has already made it to linux-next, so this should close the
> > regression:
> >
> > #regzbot fix: nvmem: mtk-efuse: Drop NVMEM device name
> 
> Out of interest: Is involving regzbot worth it in case the fix is
> already in -next? Or is that primarily to keep track of "we found a
> regression and a fix was already available in next". I don't mind if
> it's the latter, just curious.

When the fix has already landed in next, no, I guess it wouldn't make sense to
involve regzbot, as that would be like creating a regression ticket that is
closed from the start. (And basically it would mean we're testing an outdated
kernel release, which is not very helpful)

In this case when I sent the regression report the regression was still there on
the latest next. The fix had been sent, but not yet merged into next. In that
case it's very much helpful to involve regzbot so we can track the fix and make
sure it gets applied. Also, as was for this case, and probably many others, the
fix patch didn't have that much information on the symptoms and circumstances of
the issue, while the regression report I sent did, so the regression report
should be easier to find for people encountering the regression, and then they
can easily see the status of the regression through regzbot.

Thanks,
Nícolas

