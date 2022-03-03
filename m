Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vbWQkK+rFOs3z/eoZw7CrP88nZVDwLjmy3AH9nA+3M=; b=S+3E9nYrhcNAGI
	D6dg+BvVKs+eS294PcQ02wK/VoaSchU8F2IZ1pGZ5+80EFMb16nKgcEg2bGYJJHmrI7EmpW++ITz/
	MkHC7FYLX1SQM71fUP2t9w2vggwoTG+WvzjTqkx6xdN5+opKvr/FWDgw+PHMseBhzhqewLUK3aZBY
	3NZ3UsiTd0BCISkkgat+d/oLf/gSTSLbN9qgoi/ZqgS6Jt0eBiQL1htZ9wCEC2O79t/P12rGhdHuf
	2tKvJqKSTVX6lp7KLFG+nVj6kJUvxGvZM8fqhZrWdXE11/dwsekHjwbIu3fSvbAzbvNtfY8+9vOKP
	5MCHihqvoR40tqR/7dfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhF1-005o9f-Lh; Thu, 03 Mar 2022 08:55:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhEp-005o6v-Hq; Thu, 03 Mar 2022 08:55:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2401E61BD4;
 Thu,  3 Mar 2022 08:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C85C004E1;
 Thu,  3 Mar 2022 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646297706;
 bh=kU5Q06pAx6Ke2pgUtQgshelxBuHKHAWI3QpSa9wC5UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvuGsYkKqyLhu4HoxbCPmS8D8ZmQHLQY5D4+dOgwVoidcT5Zg+gPqjBJNrykjeE/5
 ZRroooUFFL1sK8UqRkSWlcH2WjnsUKpS6gNbaHTRew7U+hC/WtmD8t4getcCZvyeTG
 B/JTk5f+9WRrYk9OceV7uvBE1/ocsiIYRt5JtklC0Un+YwMRvLsRuVmBM/nCqZChYH
 pMpKXJIZYtUcRE8fIOOb0T9GTEkT0daYKeufiBdHpqEK3Ymj+yIN5oY28UgQsUdtxz
 wemjxoJEdPHUD3bnbFzvhYrwxU1oTozoHSSGYequ5W10JV5+Y/lmcIKFp78b/QijPJ
 6Fbk7R1nmxaig==
Date: Thu, 3 Mar 2022 16:55:02 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, perex@perex.cz, matthias.bgg@gmail.com,
 trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, aaronyu@google.com
Subject: Re: [PATCH] ASoC: mediatek: mt8183: support wb bt audio
Message-ID: <YiCCZoryo9LVQEGl@google.com>
References: <20220303061147.5037-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303061147.5037-1-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_005507_657935_34C947FE 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Mar 03, 2022 at 02:11:47PM +0800, Jiaxin Yu wrote:
> This patch use "bt-sco-pcm-wb" codec dai driver for wb bt audio.

If it could get chance for a respin, describe it in imperative mood.  See [1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
With some minor comments,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> ---
> 
> This patch depends on:
> https://patchwork.kernel.org/project/alsa-devel/patch/20220302013533.29068-1-jiaxin.yu@mediatek.com/

Actually, it doesn't depend on the patch.  They are independent.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
