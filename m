Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B118BC001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjKE+ZbXL1puvs6xgELJKlUdxWXD4zkVgBWZWf94/8s=; b=M75S42xyQEHP97fF3usSHPl4pA
	ODRH3BH8JzWzySv4hT2+DXCAFqU1vkuo+0xBhPH2lU8ZqRTntprXnYpBDtUKtxhan7YZ0gBphIo7t
	AoVn6wJDYKAsfNIMfex0cz8gPemt1rz7G+jDSuOc3OiIGva14+RUrMDACZN7ZeSoSnym3p+/WrFaW
	ZcDotGdyyS1r6i3xfrGgQwlqTifJI02/uFsf8CYDCbhgJzDeSIiQMGFHHiraZoMXhzHLH+wOXUU9H
	3/55qma2x9dFXm8Gc37pkelB97aeBJo2XhSiMEXPhdzgNdZMqyMJnoMZU4S2Bk0uUB/V8ghPX4Jm2
	plHTdhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnTD-00Dn9N-1u;
	Fri, 21 Jul 2023 10:34:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnTA-00Dn8K-0M;
	Fri, 21 Jul 2023 10:34:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88BAE60C74;
	Fri, 21 Jul 2023 10:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8651C433C8;
	Fri, 21 Jul 2023 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689935682;
	bh=WJzJxCInUKPeiWu8BOjg9n0XyseJhFEbFfzut3tCW84=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=il8M+HwFbc0/nsctZmOVaHVk0eX+KeRZfVGVo8UVI63eDXS1q6wOCuTyL7wAjcEwW
	 wdv/dTEC8rcBatvW7Fco1o7YLdLQ+0wCj8ZfaPBjeC2DrI0vIeE9nNdLmGVMhOZeXc
	 vsVi+Wh1NP+uUJOpI1k8elTNdF33rlqORUmSRvqAIzhyzHHVqIWLdONhcABS4ZmkQ2
	 ZyaPTiwlnlvTF1CwluBT27SIUMD/KwAVSfiTiJ5k/+bZZMaI52RnXv8pFAwp4PC2ld
	 6zMPtQfClT6f17TDEeURPwcaA83ivhx3Nz43vCxhHfHTTn/x4LaU8ipSm4b3n00ynt
	 JIGZi07H/13fQ==
Message-ID: <d50c6c34035f1a0b143507d9ab9fcf0d27a5dc86.camel@kernel.org>
Subject: Re: [PATCH] Fix BUG: KASAN: use-after-free in
 trace_event_raw_event_filelock_lock
From: Jeff Layton <jlayton@kernel.org>
To: Will Shiu <Will.Shiu@mediatek.com>, Chuck Lever
 <chuck.lever@oracle.com>,  Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Date: Fri, 21 Jul 2023 06:34:40 -0400
In-Reply-To: <20230721051904.9317-1-Will.Shiu@mediatek.com>
References: <20230721051904.9317-1-Will.Shiu@mediatek.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_033444_238661_2D4C50C7 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, 2023-07-21 at 13:19 +0800, Will Shiu wrote:
> As following backtrace, the struct file_lock request , in posix_lock_inod=
e
> is free before ftrace function using.
> Replace the ftrace function ahead free flow could fix the use-after-free
> issue.
>=20
> [name:report&]=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> BUG:KASAN: use-after-free in trace_event_raw_event_filelock_lock+0x80/0x1=
2c
> [name:report&]Read at addr f6ffff8025622620 by task NativeThread/16753
> [name:report_hw_tags&]Pointer tag: [f6], memory tag: [fe]
> [name:report&]
> BT:
> Hardware name: MT6897 (DT)
> Call trace:
>  dump_backtrace+0xf8/0x148
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x60/0x7c
>  print_report+0x2c8/0xa08
>  kasan_report+0xb0/0x120
>  __do_kernel_fault+0xc8/0x248
>  do_bad_area+0x30/0xdc
>  do_tag_check_fault+0x1c/0x30
>  do_mem_abort+0x58/0xbc
>  el1_abort+0x3c/0x5c
>  el1h_64_sync_handler+0x54/0x90
>  el1h_64_sync+0x68/0x6c
>  trace_event_raw_event_filelock_lock+0x80/0x12c
>  posix_lock_inode+0xd0c/0xd60
>  do_lock_file_wait+0xb8/0x190
>  fcntl_setlk+0x2d8/0x440
> ...
> [name:report&]
> [name:report&]Allocated by task 16752:
> ...
>  slab_post_alloc_hook+0x74/0x340
>  kmem_cache_alloc+0x1b0/0x2f0
>  posix_lock_inode+0xb0/0xd60
> ...
>  [name:report&]
>  [name:report&]Freed by task 16752:
> ...
>   kmem_cache_free+0x274/0x5b0
>   locks_dispose_list+0x3c/0x148
>   posix_lock_inode+0xc40/0xd60
>   do_lock_file_wait+0xb8/0x190
>   fcntl_setlk+0x2d8/0x440
>   do_fcntl+0x150/0xc18
> ...
>=20
> Signed-off-by: Will Shiu <Will.Shiu@mediatek.com>
> ---
>  fs/locks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/locks.c b/fs/locks.c
> index df8b26a42524..a552bdb6badc 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -1301,6 +1301,7 @@ static int posix_lock_inode(struct inode *inode, st=
ruct file_lock *request,
>   out:
>  	spin_unlock(&ctx->flc_lock);
>  	percpu_up_read(&file_rwsem);
> +	trace_posix_lock_inode(inode, request, error);
>  	/*
>  	 * Free any unused locks.
>  	 */
> @@ -1309,7 +1310,6 @@ static int posix_lock_inode(struct inode *inode, st=
ruct file_lock *request,
>  	if (new_fl2)
>  		locks_free_lock(new_fl2);
>  	locks_dispose_list(&dispose);
> -	trace_posix_lock_inode(inode, request, error);
> =20
>  	return error;
>  }

Could you send along the entire KASAN log message? I'm not sure I see
how this is being tripped. The lock we're passing in here is "request"
and that shouldn't be freed since it's allocated and owned by the
caller.

--=20
Jeff Layton <jlayton@kernel.org>

