Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73295C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRIXB7442TZ/K5oEU8NX6CJ6Dvv1kRPG/0AlFqIAhoA=; b=lplZVBqG/fT8HEvrmtG4dRq46A
	+ypInXZt3qlk2Lq31U7AOuWmO5fUJtf5Zmd6fFlM4L7EZtB2ITQpQlT0+Xaa+dh465BIUJdf6FvDY
	iS6/mY1TlE8dcJk9z6XQINh9MbjRZmSRjhDokZ6mWB69CIp9Vvu5OPXeJTSR7CItJSgqzjeOi/DgF
	acOun+lgKODrr/IqcNgLHTr8BixsE2DK14Nm4CIx8E6+9l1yy/gwrbo9eUhgjwgXr71Pyy7w5jOMX
	lqmu7HNHgnGb4I1Adx/UY5IsrfInUWVBAiiyY5hDsM9OI3aP1XP8hzdqUucw63OVZ8J0CQi1NbzJV
	yW6p8TPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1Q8-00G7YU-11;
	Mon, 10 Apr 2023 23:59:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1Q4-00G7Y2-0C;
	Mon, 10 Apr 2023 23:59:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AECD61FCB;
	Mon, 10 Apr 2023 23:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B11C433EF;
	Mon, 10 Apr 2023 23:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681171170;
	bh=JVXtANLCoXKH4bGk9XkI7snII9iDxlueE91bJgDTERM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k6A7+qy1kZ+Sfd2025/ayUX8uj9rh0rS6djSM6jD5ilFLdGQ1kACZvpNWq0UWh7jQ
	 ZGGmcdbzYYd0qFPIyUkySlNe2M3YlFPPRYZp7yyFwfPUSXVNArr0pshgN77ZrMrSSi
	 6YJVthmIfXDPBQXnWlTh1Ti+2S8gWaKjvPYd7/RsO3Y74IF5//1wt9XmaUwG4i/oBz
	 hnxC+cT24qIHDjzJHAWs8ZGtzdGp0K0EzTEoU0Tmz+LQMO3OMeNb/eAZSIEBQqHtve
	 yvzYtpvLGl0MegvHkh8vxuctEb919+dCkd0NlB3OcBEUvqL416KjvgLyJfRwPcLRd5
	 pfn5oUKxVy/qQ==
Message-ID: <502bacd2b6b0f448106d82b2d8c5c9d4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230406010935.1944976-1-trix@redhat.com>
References: <20230406010935.1944976-1-trix@redhat.com>
Subject: Re: [PATCH] clk: mediatek: fhctl: set varaiables fhctl_offset_v1,2 storage-class-specifier to static
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tom Rix <trix@redhat.com>
To: Tom Rix <trix@redhat.com>, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, matthias.bgg@gmail.com, mturquette@baylibre.com, wenst@chromium.org
Date: Mon, 10 Apr 2023 16:59:28 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_165932_164696_436F37F4 
X-CRM114-Status: UNSURE (   8.62  )
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

Quoting Tom Rix (2023-04-05 18:09:35)
> smatch reports
> drivers/clk/mediatek/clk-fhctl.c:17:27: warning: symbol
>   'fhctl_offset_v1' was not declared. Should it be static?
> drivers/clk/mediatek/clk-fhctl.c:30:27: warning: symbol
>   'fhctl_offset_v2' was not declared. Should it be static?
>=20
> These variables are only used in one file so should be static.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Applied to clk-next

