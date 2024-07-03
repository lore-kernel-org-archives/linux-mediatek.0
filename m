Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E1C30658
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icvHM6vHx5tc35KsWjVeZnOUrDfdLw9A4yDiG4jpE1M=; b=p0y3JAJkyYiXjCHcPSh4XTI59Q
	7EwD8P90aZFDvFpdtMc2fOngWEaJ2/4XxCx/o5eug9Mv14+QH2A6liRsYNfKGGlSRPEq+gQHfUl38
	wqJkIS5GolpPlGXGdS492J/OxcR8FW3G5pPp7/45nL2iKF7RwlMs7tc+wUeEB72YL+EnMS+8SA55J
	8/tsGrZQgmOtv/vu96IPJtBvdaasCi4G0ib6+RhsyFHB8/+p8CqOdT9UxT4huI25kHWSSCFK+Aaqf
	mpdhRJevO0LhhXn2mvK4ykv0bacdsDdTXFlWBGHy5mj7H5SpM5FEoIWKaeE6ry3F13zfXFYD2QEJK
	6OmfD8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOohM-00000008Tby-2eSg;
	Wed, 03 Jul 2024 01:22:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOoh8-00000008Tao-37jR
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 01:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719969721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icvHM6vHx5tc35KsWjVeZnOUrDfdLw9A4yDiG4jpE1M=;
	b=Vu+xSJXZ2pjj+4VzskVY+5pMGXR3Ezg2yUsocNCv6ZmV11oGTJgmYmFl2UHs4dc+j2G6wj
	dcb9nt9LmXcuYg1gXFKgTTGStO9LKOHgH1SZM676iySY7D/BDZKM8gSNcvJBvGFzYNw3VM
	wUuHttS3/lD5CGiGhtqE2kqAfba2qCU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-uwy92e-uMq-HMXvlP2TVpg-1; Tue, 02 Jul 2024 21:19:49 -0400
X-MC-Unique: uwy92e-uMq-HMXvlP2TVpg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ee4ce81697so50580281fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 18:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719969588; x=1720574388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icvHM6vHx5tc35KsWjVeZnOUrDfdLw9A4yDiG4jpE1M=;
        b=vowP3oakzRqvecOZYXjWhCuuQjt32vEFJDFZ8vuKkR3TejW0qlmVUu/ksId3s/aFGO
         tvISF1BL9nlWzb8UkHgz95A8MR0OP4YnN+ecO83gJh5+voSZamdo5V9ysyN657KcSFt+
         Di/CTkAkO3/s+pYfPt3qpMfWHCAsyN5kC3NIdEhbSU+Rvzq5SoOFiR8MXuALTx1zkiVD
         tpXXSVgn/m3Ksla+0FM62fKOEKmCIIYUHEBctLfSzjym99TGXfQkVvN241/85mNV6xbn
         cFKdfYU8oXEVg60mPdTlF5IzFkESsjUf4SewQUrSjAAHWRmExbjfh4fa778Lb2H56f5M
         Ry8w==
X-Forwarded-Encrypted: i=1; AJvYcCWJtut+Yiprc67iLIcioO2IXTC/zOsI8TaI8vUOFVluAz5nzBb7WJAUs9eFiN3sarkDNX963aqugPbOj5mrdccgAN/qgdycqcrv3aDpG1uRayQf
X-Gm-Message-State: AOJu0YyxcHaId+L/Qe4fadztVrfi8a2QZgIGLMwmqizMhZNiCwQCcIbb
	enUGOMr2aCEtIyU0MU9MvkCTKj5g82MUOFs4gn59tApLtwmeOW/14gA6fvrI8M1JlQDH2Z9loXW
	sI+CMspDkrkIQNu65vuBcxb7mWRTaRwvSEB9U9WQZdgoQqXOj/s4GJx/ql9Nlm6bYNs5yY1vM65
	pkJ2EmlayGsVYZqDd2VD1GMhyIKqZyUpCpCyAPGuwCUKBB
X-Received: by 2002:a2e:87da:0:b0:2ee:84af:dfc4 with SMTP id 38308e7fff4ca-2ee84afe254mr1112251fa.43.1719969588353;
        Tue, 02 Jul 2024 18:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpSlLCK3MniAmeHCNTRdpfutNVFg4NqDVwYsLGRYKV+Sfjk7uWrrnhbyYN8jIK9spnz0JpXL33Bgon8txPAoQ=
X-Received: by 2002:a2e:87da:0:b0:2ee:84af:dfc4 with SMTP id
 38308e7fff4ca-2ee84afe254mr1112141fa.43.1719969587971; Tue, 02 Jul 2024
 18:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-filelock-6-10-v1-1-96e766aadc98@kernel.org>
In-Reply-To: <20240702-filelock-6-10-v1-1-96e766aadc98@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 2 Jul 2024 21:19:36 -0400
Message-ID: <CAK-6q+hCQNg8XK7v86hhgsgPu2c_aN_+xRZBzTG7DQ-fee8vRg@mail.gmail.com>
Subject: Re: [PATCH] filelock: fix potential use-after-free in posix_lock_inode
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>, Alexander Aring <alex.aring@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_182202_861289_6DEAF088 
X-CRM114-Status: GOOD (  10.43  )
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

Hi,

On Tue, Jul 2, 2024 at 6:45=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> Light Hsieh reported a KASAN UAF warning in trace_posix_lock_inode().
> The request pointer had been changed earlier to point to a lock entry
> that was added to the inode's list. However, before the tracepoint could
> fire, another task raced in and freed that lock.
>
> Fix this by moving the tracepoint inside the spinlock, which should
> ensure that this doesn't happen.
>

makes sense to me. Thanks.

Reviewed-by: Alexander Aring <aahringo@redhat.com>

- Alex


