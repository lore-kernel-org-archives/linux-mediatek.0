Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D16C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:10:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BEC230FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BEC230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WbB410TVv021yeql9obIRZIK1vIoxq2PikEgZAKzNEU=; b=2GaX0fUZJiQZY1CJv7U81rKA4
	2RVVLgGC7CE/NXPzS0iM34xpYp0n36REj22nsMWmWjGTHGgCa5d1uWlLVUf7lSfDHxT98WsMfNzvT
	IUd8kAaeTWqvdMV1VU0bTdugnP3HcOj2amZYur3mW9joYroFXkZZYnYZdTeJ1T4fH9L6ZKPuYFYxM
	cQ/hUAWmkqeUzkxtecQCNfWV6cSzkn3kTqyo0F8YnP8z36lw5jILmyPCIzFbywYzczrrIpKgAT3Ns
	/z5Cw4n4Uy6wObAJUsPEV9QlTmfvFTZCVQ30G4B3VY6apyW/L1fHLq2Murx5DVQsJMYMzucqmesom
	2yNztwXzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPSJ-0006YU-DW; Thu, 10 Dec 2020 17:10:15 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knPSH-0006Xe-7x
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 17:10:14 +0000
Received: by mail-io1-xd43.google.com with SMTP id q137so6255110iod.9
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxPYeFbmqiuc8YA5Ewflum7dVJyQs2NXh77VNKbBmOM=;
 b=v1jIJoQcl/nZjj7VeslgzSbPEzPrPrpFYskI6k4MY4HvHzJ+ddNDapCNvjEIutnYso
 DDafuUSxPIIneMf6RMKne4ZyrTGWx3GzT0q915nWx7n/MgAXMFyw9wW5yur6IOFbDAuR
 JdOihPS0URrzgXnlRBdougkyG3UnzLS3PxunUjzmKF5Qk6vCkTSnC5YgvoA1VuvLYmU+
 EioZtjRr1VDBtTJr6eAHY3sQnRfS7GWZNSUUMxvEy5elh8yeO/aMR8/SJ3fq8F/iavO6
 pfWyhgXLMwUuztpBXrtVHp2PvsPAgN/r/43s+f9zW2I5olrgwFcIuPfxPza+P8QgOBn5
 rpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxPYeFbmqiuc8YA5Ewflum7dVJyQs2NXh77VNKbBmOM=;
 b=jDR7p3AnQ6rmKSpeBmTjokOPc9dFR+qjpSbqeSh2PkmHLkmvZLXZUU6+qPYIsOULDz
 8NGr7tEofaajIIkZRnvqzJ1exM6G+42x/F6tUaxfUnjh9rMnhgsS9FpUn/QLG7e86hpF
 edHh/++cYJ5LXVfkrHSdzPC1hDjLMeOmm0jKNKj+dquoQjOE2u7Eze+PUtZVmfwxCT7B
 QaAv1M2nDSFdmECgIUB1dC0S9RmYyoQK7ZizcFbx2EtV1GecXvwcLlFiUs2OjByS+2/w
 hV52lfwMaoKfEm2PcWID3ibUeV+f0Liu3YjaY/D0J2I18smK74jRBijX+FSKrC1j5NAB
 rDuA==
X-Gm-Message-State: AOAM5334X5LR5k1epdb/JkK4ti7tOFSGDkwGVuvQ4Vjt/TciK5bv59AC
 seJUxzZXUO9CkExWeNVwDmk8dV5izDLQpLx1B6SYQw==
X-Google-Smtp-Source: ABdhPJzvyOr9T1Y9nDhO6Wi5DNHo43qFzMIfvoy29vbI3YPba6rqc1w50ZEtvjhH0ZxsJuQ/N/YKMQDED5PmGh42h/Y=
X-Received: by 2002:a05:6602:2d49:: with SMTP id
 d9mr9126517iow.109.1607620207280; 
 Thu, 10 Dec 2020 09:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20201210054109.587795-1-tzungbi@google.com>
 <X9JUmRarnxPaXtrZ@builder.lan>
In-Reply-To: <X9JUmRarnxPaXtrZ@builder.lan>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 11 Dec 2020 01:09:56 +0800
Message-ID: <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_121013_344391_1EBA0512 
X-CRM114-Status: GOOD (  11.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 11, 2020 at 1:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:
>
> > The correct MT8192 CFG register base is 0x20000 off.  Changes the
> > registers accordingly.
> >
> > Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
>
> I presume there's an associated DT change with this?
>
> I'm okay with taking this, but would like to have Matthias ack on the
> fact that we're breaking backwards compatibility with older DTS.
>
> (Or I could ack this and Matthias can take it together with the DT
> change, to reduce the breakage gap in the git history?)

Yes, it has associated DT changes.  But the board "MT8192 SCP" is
still under development, the DTS part hasn't been sent to upstream
yet.

Thus, it won't break anyone else.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
