Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32C9606A324
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UduQqf2Z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cXu67qd7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e6r/HJ4fnxt+Ympvhnm3lqzuKNTZyC1RsNKqAM3ic5c=; b=UduQqf2ZbvPCa2tjehqKSW0ID3
	BlqxYOSr5K5kdcuMEcIsactGBXFaHfFAlFnPEEzRXBf+hvWCjc88X5nE9JeWGgXELk1IWMkmSvZVX
	ozExclvk5vWPzoFCB+U+MVnX2buuAJNBNdfnDKEa55LGEQFmHfW5L6Fhoa4i/lCf8Q44cUl1fgB9h
	xQUtlHYCzGNT3G/yyyJeOJmv7efLwTx6+7OK3utGknkQ/MkKujVrJNzoDjJwWhUpR0OVMUiZ+2sta
	mzzWOtvq49ReieYHXWB0g8C8KFLF7WWzY6zcXVVKX3F8b4sEcwVxyQEq7swOlaFh09SKteyh+0lgI
	Ja507kQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREXC-00000007anK-0jVK;
	Wed, 11 Nov 2026 20:03:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREXA-00000007ame-0Wm3
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 20:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794427383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e6r/HJ4fnxt+Ympvhnm3lqzuKNTZyC1RsNKqAM3ic5c=;
	b=cXu67qd7+uKBD6kjnYL4BujoLhZi2hLoYQvAE4CKB0yPGWOtZHoFQW+JYVDJ+rsPeWB0Oy
	HrJ+iVf4uHagMPDhoD/W9oZmpr1a49DuMIP+UzbfdxFdLiB8rwfy8yHACwTLmDLm+/4CXh
	cYmPpAE8J85Jn2lwBAD0i7PYBAwpNeQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-AM8UFLq6MNq3UAZpDWmj8w-1; Wed,
 11 Nov 2026 15:02:57 -0500
X-MC-Unique: AM8UFLq6MNq3UAZpDWmj8w-1
X-Mimecast-MFC-AGG-ID: AM8UFLq6MNq3UAZpDWmj8w_1794427375
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F6E219C960E;
	Wed, 11 Nov 2026 20:02:44 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C57E3344;
	Wed, 11 Nov 2026 20:02:39 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 11 Nov 2026 21:02:43 +0100 (CET)
Date: Wed, 11 Nov 2026 21:02:38 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-team@meta.com,
	syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] reboot: halt when power off fails
Message-ID: <avTJ3o-n0UZS0YUj@redhat.com>
References: <20261110-reboot-make-task-dead-v1-1-af88a3f37bf7@debian.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110-reboot-make-task-dead-v1-1-af88a3f37bf7@debian.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: sBVaK71oHCA7h2W6acXNyh3gbBDDYFuTIqrFSQLIkC0_1794427375
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_120304_227504_F2FD2E31 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10, Breno Leitao wrote:
>
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -791,6 +791,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
>
>  	case LINUX_REBOOT_CMD_POWER_OFF:
>  		kernel_power_off();
> +		pr_emerg("Power off failed: System halted instead\n");
> +		/* kernel_power_off() already ran the shutdown, only halt. */
> +		machine_halt();

Agreed. Even if I don't think my ack has any value in this area:

Acked-by: Oleg Nesterov <oleg@redhat.com>


