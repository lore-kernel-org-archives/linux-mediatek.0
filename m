Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344E7C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrFw5Lik5O3blKsw57AYQOVhdr+mQJkrP9zFc2yUWc4=; b=vFmhcY6KhUncVGZZ/DUICKLdFj
	7a36RivxqKgjWInnRJuNYzPGD4lzX1LPssYkum7YjWG6Jzs+uZYo6t7hUxRUnf9kYNn591jlLKrnS
	3Fi11Ax8yKC747UMl1mpbi3gg+CqDnJnlU4yFMXYww3QgVEoi4tTb5bIi7XGJ7bca2QelS5GSToj9
	bLdsM5/WWOsvS0DD5PSQjUf885QgcjQNCh95rTFvLyuJwLw9GzbhF4YzN3JAtpfBo5osAUecJoC2W
	04QVrOh23wyhMq4HMITESTqegxYKPX0VFw/4l63MtckZfEn3Bv5QURlycKw1V2NsAplfCRHTTecR6
	b1kK18FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPi2R-0000000FuXN-1F2g;
	Fri, 05 Jul 2024 12:27:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPi2C-0000000FuQX-1w2Q;
	Fri, 05 Jul 2024 12:27:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a77c9d3e593so80643766b.0;
        Fri, 05 Jul 2024 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720182446; x=1720787246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrFw5Lik5O3blKsw57AYQOVhdr+mQJkrP9zFc2yUWc4=;
        b=bCnyoa3sUDXdUunYMwsR47Az/g3HlVVrJGwmq2E5jDaDCOXOghTjhOnMi3X69UGy2m
         TOnax6k1NMZs99UkPr/flYLvN6pz5By/BNSUVf32xtBd553xrpB75+C8UYvySqD7JMZI
         +UOIK5ZNuwBmQIEb5XqGzAevP3UcTqkCDWjxvcLHiFH6rTJrrUvc5Le3QtRxxonOtiKg
         QhkP84/v62IPAgdHvUR9PFomm88X2LUYxA8XeX2nT+rHquUR4S/eGO7YBIyxpWLBLr/g
         9jDFvlqu7IEMH4bkABLqH+nqsDJxR4A3iTxJY8mQzXDjgo3cO0vf/0SA0pzmOkD4AdCf
         MyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720182446; x=1720787246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrFw5Lik5O3blKsw57AYQOVhdr+mQJkrP9zFc2yUWc4=;
        b=n7e85SOWHqw7/exYpgf5iiNOsDVWoBwMebkCKI2rulmWQTQ5XvYAZlLHixs7LNVdP4
         DBJq+CjoBdXZa50xLO5Rd5LTxiByeITrgzyQfwgapsYU9oZF0WYr4jQk29n1NV/KDIQ+
         +sAc/fBFOd+C0DujN0WhWREMIJ2z7QazPcll647f85eJrzgaXCAAKZEAvOtovHEoYNYz
         8KJsb+PjgXFIInmCmc/0giOQ3eJ102/uIQIAIc7MNJMmFBnbIMhGW5K/BR4/daJLzpHM
         Qsv+v9lZqHZh+mZnfVYKzTmPOUJIjDO0YsYYuL+26umLGfHTiGj3m/LGOauVNbelb0CY
         5LBA==
X-Forwarded-Encrypted: i=1; AJvYcCU4CEZeUvIdRPHqEcd6Fk4W+hVjguhh+uaXJOYP30bdceu6Bq9ouJfRYJdPSGurzf26z3NribTTiWDnmcoXFlAmEl4Nla2ikcLPPqpHJvkiYc0aNWQv273BtivTjyuSMQIe6sB1mgPz0qQAG+XB77HbbCQnCf60Mtg=
X-Gm-Message-State: AOJu0Yw7AdaxRxuq6nT8TonXhwCcHwEGqDdRsg9gAvQCtjuxDLEQLy9e
	p29sXfNlprRvVSomDdpVfjLoenH+83XR3Z3kiPK452/qJSv9k3ZcU4EDlqsnmduYIFQsmJC65bI
	cib8UQbjvUr/LKdG9uXt5TXbaack=
X-Google-Smtp-Source: AGHT+IE/fmdXPB3EONv2sJvLDs8SLrR9Aygswq6SzO7JApr9zCVnZCFzQptSkhO23Z0bgNjdwrXPh75o4PlNnmmf7yY=
X-Received: by 2002:a17:906:2dc5:b0:a77:d52c:c431 with SMTP id
 a640c23a62f3a-a77d52cc489mr79643966b.22.1720182445705; Fri, 05 Jul 2024
 05:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240705081642.12032-1-ed.tsai@mediatek.com>
In-Reply-To: <20240705081642.12032-1-ed.tsai@mediatek.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 5 Jul 2024 15:27:12 +0300
Message-ID: <CAOQ4uxitFgaO4D5pg54b0xj3Hnt61a+3BAHnEd_t3T9yzpXptg@mail.gmail.com>
Subject: Re: [PATCH 1/1] backing-file: covert to using fops->splice_write
To: ed.tsai@mediatek.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	chun-hung.wu@mediatek.com, casper.li@mediatek.com, 
	linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_052728_526526_56451E69 
X-CRM114-Status: GOOD (  17.77  )
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

On Fri, Jul 5, 2024 at 11:17=E2=80=AFAM <ed.tsai@mediatek.com> wrote:
>
> From: Ed Tsai <ed.tsai@mediatek.com>
>
> Filesystems may define their own splice write. Therefore, use file
> fops instead of invoking iter_file_splice_write() directly.

This looks sane, but can you share the scenario where you ran into this?
or did you find this via code audit?

I can think of these cases:
1. overlayfs with fuse (virtiofs) upper
2. fuse passthrough over fuse
3. fuse passthrough over overlayfs
4. fuse passthrough over gfs2 or some out of tree fs

The first two will not cause any harm,
In case #3, according to the comment above ovl_splice_write()
the current code could even deadlock.

So do you have a reproduction?

Thanks,
Amir.

>
> Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> ---
>  fs/backing-file.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/backing-file.c b/fs/backing-file.c
> index 740185198db3..687a7fae7d25 100644
> --- a/fs/backing-file.c
> +++ b/fs/backing-file.c
> @@ -280,13 +280,16 @@ ssize_t backing_file_splice_write(struct pipe_inode=
_info *pipe,
>         if (WARN_ON_ONCE(!(out->f_mode & FMODE_BACKING)))
>                 return -EIO;
>
> +       if (out->f_op->splice_write)
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

