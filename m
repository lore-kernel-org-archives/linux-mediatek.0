Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCaboTL6JZDtN8ySKVg86Lvk0MzF7bRRmSJbRqfT4ys=; b=M2Xz24ZQmvKFNH
	bdWEMOrwoM7YuEn9+fNc6uFb0ZYJh9ym+9Dv6SviUrDuLbHsBwejesM52h528+MN5O9dImUZ7Uc8D
	PAU/m8Ol2Tv6seeZu4+7lwk++bNmCaaXj2/h054klC3BEWQgKVY0gDrFvOVHDM1fac5tR1Nq22BMX
	GgskngI95vFbYx/2qRFRMml8Oz+nCSLwDxGn2vtngRtnmMt80Fszu32at2PMIoaG8Stqj2At97lQA
	Ip5rt+tN4L4Iplh0i8847yDNll3GILHe8TES02O5F8Sk5LaU8nYn+Kls1ZUFS5jwpNQafVfiiHfk+
	FWVKEv0LCxHVp3zXm6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRPG7-002QNo-R5; Tue, 08 Mar 2022 02:07:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRPFu-002QKK-90; Tue, 08 Mar 2022 02:07:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C75A7614DB;
 Tue,  8 Mar 2022 02:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC39C340F3;
 Tue,  8 Mar 2022 02:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646705237;
 bh=FO6In/hNNc4+xoPxbiFoiYv5P+ui3FmIN6FYKohezhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uWEhtOmJW/pKK74Snzk7xTRhXgv+PfECzwVqS27gC2uv+FBBOo2AXWAgabYKNVt+d
 BIpJ7iZ3Po4HwcDzJ2hpIyY9slGkOFUek3mSOweWaJP0o/zgPHniPfXS6Xyl3xMy1W
 /Rz66R1l94kASKpyuLrtXi4v3LP3KIXK83RPsRNHnYK8H37abZa9gw0YDgOf+fJ5mT
 6wlZKEO4BNF+nJDa24rlmgPk8Ol+VRhvkNLmeyoJZTOsORSomSuhi/Zxur3dS3afTk
 gHtmjt9unkJHUiRS3XFhwxJiPq9vqDYTFwB5u5Orq1KvIua33EI8lHPbz9O6CKRza3
 0tw+AZSYQ7mmg==
Date: Tue, 8 Mar 2022 10:07:12 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Fix error handling in
 mt8192_mt6359_dev_probe
Message-ID: <Yia6UG1fMZGSYzcs@google.com>
References: <20220308015224.23585-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308015224.23585-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_180718_383645_4C583E8D 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, Mar 08, 2022 at 01:52:22AM +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> Fixes: 4e28491a7a19 ("ASoC: mediatek: mt8192-mt6359: fix device_node leak")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
