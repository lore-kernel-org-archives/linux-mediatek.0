Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D10C25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAc3byTNBsHPa+WdoCVtnwL96sJFYPacjsD1Mg7kFVQ=; b=sMKghbEpdxLHJVrPZR9s7AHrmU
	8E/PNcWhDnqdbSuCKtZaLqtEka8Cv+oiUORYTxBk4r5siqDLu+J2K9W8oTCmpKw7N3Izvsc04pAk1
	PA7/vhbn1G3CmvW4ORmeEfouDKa3ePxiRKnHJZIniTBdukoB//cyXbMtMwi3EjdL9pKG/2sAdLUUG
	hATbDF0HGyMBjFSkYA4tw0iHnqcxcO8lQLQBgwdTufnQjWtDqXWQ3psWARgP1C9l+ZjB4jTAAvCqU
	8lU7mouEtekspsjlqJf25VAynv1db0PALbEv4MAppB6E8XRt4tNRgF9/UTlUJ373oyMxXuomhQ8AN
	dZd7YoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QTM-0000000CYWl-3OGw;
	Tue, 07 May 2024 19:27:32 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4QTJ-0000000CYSM-0eSJ;
	Tue, 07 May 2024 19:27:30 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4affeacaff9so1005775e0c.3;
        Tue, 07 May 2024 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715110041; x=1715714841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAc3byTNBsHPa+WdoCVtnwL96sJFYPacjsD1Mg7kFVQ=;
        b=leUYxRvkKbWN0olY8qJFQin2Ns0nNtS9HHQfjOPGhzkWBeu912sImwZoHNfs5ICSns
         lB0TV7sVINMJDUsV244yz2JPGlijK6/3+D7LL/9WFYAO4dSlo/AAAEA2tdCr74WyvbMj
         3OV0qeC5/5RWShHqetWWi3W/gJLaPqp/K2ov1WhcVOjSThfW1+eAuTkqQPYEmP3lZVZ7
         1D6KQJEymHcD9OoK3cBxU+FgTLReOsL1nKN7yfvuqQP3H3BFVnI3xcB4ggb6Kf9fCQtl
         1YtBOVhcN/y9xxFRJQSXfROLDe8WbPwvp4WB+yOm8ZKsHwBrbRKEG30FXfgV7C5XdNWr
         7Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715110041; x=1715714841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAc3byTNBsHPa+WdoCVtnwL96sJFYPacjsD1Mg7kFVQ=;
        b=XJIhvNmwFd6Zp8wRSKttosZbMx51rlv03uyE5zqaXWjii5XJtKI5y9Qsdz1xtJbgNl
         s5nt71EfA/lmiiaD9A6+yhSfKmEEhvjXI6gJzXF+oneiEI28A/aUnyMh8RCMgXtQEx0S
         jMSB1I9/uT8PYIyh8JC7OwWracmDCgt9NPOkKnap65M8TlvmZOwH6vDF8yTwoH7Ooh+q
         4v4QWi91jAkRbiTYDsMgzoN48dj4w1refvdZmJPHvnL8WvKCjxxcaHaxoNkN1p4Nt7tN
         17c6vnCygDHjQ4gal9gdA2S4ACK2NPCLciXRkRWobYI+3DZT8gXJHSU3JjO0i5C0ckeY
         FIaA==
X-Forwarded-Encrypted: i=1; AJvYcCXcsWD+9mf8OvGNJBQxFfBtPn4A0ra5L9lu0uxfwdSsEQh5e9bFhWq3SEAoguvYn4Wq5b/MbJbFak5WRKzzzc7bVcEowUaIXpcaBuFX25WPbJynRg92sGUkHJOA7Hvk6Tju2rhGgwKCyeKa7WDMdKuhTXIl/dwX9LM=
X-Gm-Message-State: AOJu0YxQbDj8Mw0tLpTXcsYZOizNgKWLqAxxjUztvGrIvEzQLaVpOQzU
	dU7mnR9DfmJuo26TiMAWVje5kMozL//hkNKaJjxFW9DShtncfNlNzRSEpUNxlwAFwWo6D57lvMJ
	UkAXg/1VvZqdD3wVotKshjaMr9ck=
X-Google-Smtp-Source: AGHT+IFNdkHpD3Gwn20I/Y7Qjqry/oQQapXeMBHaaXt7fkTgoavVUMdoy9nyAnEFQ2HO1nDpfnp2Y4SnJOqaHSWKU1A=
X-Received: by 2002:a05:6122:411b:b0:4df:2b08:f217 with SMTP id
 71dfb90a1353d-4df69181920mr566063e0c.6.1715110041132; Tue, 07 May 2024
 12:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
In-Reply-To: <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 7 May 2024 12:27:10 -0700
Message-ID: <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Allen Pais <apais@linux.microsoft.com>, netdev@vger.kernel.org, 
	jes@trained-monkey.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, kda@linux-powerpc.org, 
	cai.huoqing@linux.dev, dougmill@linux.ibm.com, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, 
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com, tlfalcon@linux.ibm.com, 
	cooldavid@cooldavid.org, marcin.s.wojtas@gmail.com, mlindner@marvell.com, 
	stephen@networkplumber.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, borisp@nvidia.com, 
	bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, 
	louis.peens@corigine.com, richardcochran@gmail.com, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acenic@sunsite.dk, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	oss-drivers@corigine.com, linux-net-drivers@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_122729_217374_BA02204A 
X-CRM114-Status: GOOD (  20.16  )
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

On Tue, May 7, 2024 at 12:23=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
>
> I doubt you're going to get many comments on this patch, being so large
> and spread across all drivers. I'm not going to bother trying to edit
> this down to something more sensible, I'll just plonk my comment here.
>
> For the mvpp2 driver, you're only updating a comment - and looking at
> it, the comment no longer reflects the code. It doesn't make use of
> tasklets at all. That makes the comment wrong whether or not it's
> updated. So I suggest rather than doing a search and replace for
> "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> it with) just get rid of that bit of the comment.
>

 Thank you Russell.

 I will get rid of the comment. If it helps, I can create a patch for each
driver. We did that in the past, with this series, I thought it would be
easier to apply one patch.

Thanks,

       - Allen

