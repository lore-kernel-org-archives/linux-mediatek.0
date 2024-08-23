Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB09C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Aanka2PpayLsWVfpyn/8lArNZtYk4+n0lwBfiN9yMw=; b=NiLj7kQvvsxQimUB5kKYBy+DNk
	aN5h9SnMYcBUrQQZjit5NLtafdSZq4wUDZwk3phU3MGr/simIR5misftuLZY/UOlPJfKcID2VEeCx
	kAegN62H/b3k9fN+5faDfi+kCJkxWfpxa/i3IdifjPZIIrhcEfpG4g4jnTOy1eJhfPcY7Uzk82Deo
	6g2nafRtOOTDOtpwchrZ/6rDi6Yg+U6rbVqEBQd+JQKfZ27KCZqJJKYixva6C4i2bXx1OFHeBIqbW
	Qsycby+RdW5eNg3rN2jRY77NpEJ+upPKS3Zgtd1DL9g5wfm+HBBdHwK8k16v3iXPDSHNgIfwOksv0
	rtaG+jWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQUu-0000000G5WA-2Y4h;
	Fri, 23 Aug 2024 09:22:20 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQS2-0000000G4hF-3iac;
	Fri, 23 Aug 2024 09:19:24 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-842ef41238fso539608241.0;
        Fri, 23 Aug 2024 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724404761; x=1725009561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Aanka2PpayLsWVfpyn/8lArNZtYk4+n0lwBfiN9yMw=;
        b=OeJf6VaGlr9xoBYVh3ZnmiPN6JiP1AyVfpokCiGmLey/j3NPNzH1R/j/WPShtJOrqU
         Di1VPrh2jx2g8k98xXt/LicWY0QQM7XKf5xzstupxgEHoSiF8/v/Uj2oWirx2lF4wqC6
         cXT6iXX4lyd8C1+zSTARciPnU0V0IxUbW1VO4/LJD6SISjRcAGMNza+Qjoo2K6mgRiOu
         14EFD/tZ9Y/5TPAmbIAeCDZc6X81krAb5tOS9qRr6PKxGtqodLNPqr2i+2AfBpBbqVCl
         35yv68Bes4aLWXWvNmB7VoWV3QgcAsaI7VR8i2mz/qiYOp6EDzi2JCWGBukTKpezQVUw
         LVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404761; x=1725009561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Aanka2PpayLsWVfpyn/8lArNZtYk4+n0lwBfiN9yMw=;
        b=oswIdEMLYGbF+JBY/Ypaf3sXibP60/11AG3egu4uMJbJhX8iRj7DEDMGytRaiR3N6R
         6gHNuA6r5QW0qSgzs6O49mXkxBd7S8HEjkbfDZAouDfMAMPbCDfiT3Drg/MTPpmlZLc1
         pj82KkLFHceQyQKHM3Ekk0j8wgbNmfB5ToPVHXgMZ+94i/JsVqOc+hHtImP61PtLuvmx
         0NZ/YLWwAkgmiUhAUOkDA7iEIK/j95vjwWiUt2f7cgwenPQgOpSAx6mOs8VL2KDq1fZl
         EUCUoz1hJpDXZF7boHlE/1O++3KvV5urFiA76yYK0kk5o0zQFo6qtdgrBIj4xerZSBsF
         a4cA==
X-Forwarded-Encrypted: i=1; AJvYcCW24EPv9RIVMNU6W7zCMf+YXTS+2bPjR/7zA8CS+4n6wALZdxyaTbS/eThZ/fP6ly7n+w751tADn2YIXWXwdDk=@lists.infradead.org, AJvYcCX8oo7G+YeNfEQt9ZO6V1cI0gNmuG1A5c9OGG6T607+ShEejhPmSdoKw8I9xWX89UWM4uQK9NETow2TorWlaitR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn+XdsF7aZqyGamHAlhuWnaV9W7xv3dKY9lepvLmNMiy71Bj/J
	XoYpxLsHc0PmDcTWuLsOOJCx2Tmed6gVkJWh5khyF3nHjsM4pKsK4MrbdOjLMsygQa1c9bHR199
	7X6/npprCCYsRTiKAtiPHEtQD7wk=
X-Google-Smtp-Source: AGHT+IE9kgNHk6QBa2umXgprmSxk1o4/YViXD66++2xa1BzhHFTA6Y543TCkCl52NCRZ5fO8JYHBI4NWztjCTln4krY=
X-Received: by 2002:a05:6102:38c8:b0:493:b484:ac06 with SMTP id
 ada2fe7eead31-498f4bfa0b1mr2011900137.21.1724404760959; Fri, 23 Aug 2024
 02:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240708072208.25244-1-ed.tsai@mediatek.com>
In-Reply-To: <20240708072208.25244-1-ed.tsai@mediatek.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 23 Aug 2024 11:19:09 +0200
Message-ID: <CAOQ4uxjySyTMRQDuFDsA1XVK210K+8CHh3LoSU2zYynh5OyF_w@mail.gmail.com>
Subject: Re: [PATCH 1/1] backing-file: convert to using fops->splice_write
To: ed.tsai@mediatek.com, Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chun-hung.wu@mediatek.com, 
	linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_021922_955443_3665521E 
X-CRM114-Status: GOOD (  17.65  )
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

Christian,

Would you mind picking up this fix via the vfs tree?
The reason that the Fixes tag points to fuse passthrough patch is twofold:

1. fuse passthrough is a new user of backing_file_splice_write() which
    can have a fuse or overlayfs backing file with custom ->splice_write()
2. overlayfs can have a backing upper file which is a fuse passthrough
    file with a custom ->splice_write()

Thanks,
Amir.

On Mon, Jul 8, 2024 at 9:23=E2=80=AFAM <ed.tsai@mediatek.com> wrote:
>
> From: Ed Tsai <ed.tsai@mediatek.com>
>
> Filesystems may define their own splice write. Therefore, use the file
> fops instead of invoking iter_file_splice_write() directly.
>

Fixes: 5ca73468612d ("fuse: implement splice read/write passthrough")
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> ---
>  fs/backing-file.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/backing-file.c b/fs/backing-file.c
> index afb557446c27..8860dac58c37 100644
> --- a/fs/backing-file.c
> +++ b/fs/backing-file.c
> @@ -303,13 +303,16 @@ ssize_t backing_file_splice_write(struct pipe_inode=
_info *pipe,
>         if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
>                 return -EIO;
>
> +       if (!out->f_op->splice_write)
> +               return -EINVAL;
> +
>         ret =3D file_remove_privs(ctx->user_file);
>         if (ret)
>                 return ret;
>
>         old_cred =3D override_creds(ctx->cred);
>         file_start_write(out);
> -       ret =3D iter_file_splice_write(pipe, out, ppos, len, flags);
> +       ret =3D out->f_op->splice_write(pipe, out, ppos, len, flags);
>         file_end_write(out);
>         revert_creds(old_cred);
>
> --
> 2.18.0
>

