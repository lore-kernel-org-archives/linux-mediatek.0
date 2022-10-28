Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD8BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqGUg/eLGyel4hPUU/UmzPOrllzKdZ3N79OsALsjQc4=; b=NhtaSSofB+Ng6S83dqfTGKHtAJ
	QwvUo3IYuxaOcpkNsXT8lVHncu7ns10ROVqs2aXnMSfiTfsU59sXxLXqLQEF9aAqtENC3wWKa8Aga
	wbyLMIRcC5j1Vbbq/v2RpBuJnFAXySgsRa+UgfaxgeXZjCxXzs2YVpa14wFkA7Cqp+e7uZnuDB2ot
	SiX5zh7LVU7vjo2BvZgvV7CRIJVPsjw07pgQURo/U2wyDfw39LyV2MVAomCLugsM2bilSZPxwTiz2
	UxYJlNtqyEasmu1tRWxS54ISAOcZPhM9x4aKBMwggwMdivFM5Hh5Yb7W5Sbv+KR+YO6KoWPZQctJg
	5b0oH5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMgj-00GgY8-LQ; Fri, 28 Oct 2022 10:34:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMgW-00GgUV-Du; Fri, 28 Oct 2022 10:33:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D444A62605;
	Fri, 28 Oct 2022 10:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DD3C433D6;
	Fri, 28 Oct 2022 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666953234;
	bh=yYY52+M13hWrqJU6NL54oJi3GSh9XgqjKNnE4Zx4jos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQsBmQv9M44f7b8F5Wn0DVVo0y1nv78b7L6ibXBRArg0KzfUUEufrVwX8dy1nJcvL
	 7CJIMFMkqq5Gac+2i9S6oSkTzeKdbkfbKqwTeWeknsPV9V/DGGJWvWl9QpSst3i0PT
	 9wdDmSxiOmJtU5DCyEOHjJdgwQGflCxONnnGmXFc=
Date: Fri, 28 Oct 2022 12:33:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 1/1] vdec_vp9_if: add check for NULL for
 vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Message-ID: <Y1uwD66oqzLGufuq@kroah.com>
References: <20221028100539.30925-1-abelova@astralinux.ru>
 <20221028100539.30925-2-abelova@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028100539.30925-2-abelova@astralinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_033356_548474_5911B6F1 
X-CRM114-Status: GOOD (  20.42  )
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

On Fri, Oct 28, 2022 at 01:05:39PM +0300, Anastasia Belova wrote:
> If vsi->frm_bufs[vsi->new_fb_idx].buf.fb == NULL while cleaning
> fb_free_list NULL-pointer is dereferenced.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index d9880210b2ab..dea056689b48 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -512,7 +512,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
>  	 * clean fb_free_list
>  	 */
>  	if (vsi->frm_bufs[vsi->new_fb_idx].ref_cnt == 0) {
> -		if (!vp9_is_sf_ref_fb(
> +		if (vsi->frm_bufs[vsi->new_fb_idx].buf.fb != NULL && !vp9_is_sf_ref_fb(
>  			inst, vsi->frm_bufs[vsi->new_fb_idx].buf.fb)) {
>  			struct vdec_fb *fb;
>  
> -- 
> 2.30.2
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

