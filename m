Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6649BC54FC6
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 May 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=; b=Mn1Uu9FPhNsu13RK2an/wcBaH0
	uv5jqPgRcjkrIKmvtLgX8hcEl5SXQgp3FRS33Bp6zbuH7ZdtdDsiBfDxmQJqxYxe3kG0KM91+shBZ
	TKDC6R0KghDDN5/8W4QDH/Z1hNkLLkugbIFJDTQkY+1mH19ijVclKsCYwRM+J1bigvQeMA9HGCADB
	E/DEyBEBqUdmQe7Ew7Mcq1G/tKpCYu/VFCJseWqk8OlRo5NyJIbJ7s+qZxhFWku5RHLhYZwNpEXc2
	d2LvTfRkelwINq3PxM0HRyfPPITHCtIjyw7cosY+vt/4pzPS+IE4Jmpm53CmbCcgLnkmuOnSIQLip
	jIXA9sTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIoHh-00000005riJ-0hLp;
	Sat, 24 May 2025 12:47:29 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIoHe-00000005rgS-1wLr
	for linux-mediatek@lists.infradead.org;
	Sat, 24 May 2025 12:47:27 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4772f48f516so18668621cf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 24 May 2025 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748090845; x=1748695645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=E8hO9rPhMyyi2pDVFNxq3y9cjtnJ9dziB8frgcD+pv9Heu6LPs88x7MNVJ+0314s2K
         ZqsDIKeIHCTNNKgXg3jjpcXtzsuLmSjzqJsVZEZZRWxnJsGgliCAj5HarMHI7I0mjfu+
         yenaDc3zXXP3rptNztdk24fXtLYdlWMGSbjefAAx3w4xY26/zBZVDO5kU1d3LZMGWpMQ
         InvMRCKnK4GFse2VRwbVHGhXaIaSiv8mnR5Bcrfb5Y/wnEc9Y0jScqRPXbzezMYHH7NS
         qrIExyq/DQt9XtNlBcLw/jIZs+aVQRy7Nv2YL/b1vR0xPeLNCuiibPUjqevIljwLTkjx
         I6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748090845; x=1748695645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=lrizk1NsS7TrjTIr4Vs8bEP+lt1QDBFDKbc1Ax745k3RogbkFVKX9gl/QsvqAZV7ys
         W1cnHe2Ua3A7Kw9lXGR6w1r4wyqvwi/rfI1cgUqGUf+mqv2WLjtjn7Y+DOviyzXaRyHz
         1cD3dKiGldOOpVkW9og5M08I+3UMrLNNjLSvHcH3gyjZAhIa9hFDCEhD1rFXUoCYhBXZ
         ytfCzOYpN3kJSWgPA3oasipUxYmIMZWXNbK4/Nb48ATaZSVTYRjls22aNB8aY8aTHfjB
         7zM0JlU8C+x1YXvdIi1IV2A3UqMatqQioKIryCjrQrj0WBYjbN5anJ+mLgSt3RVftGcd
         k8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9QUyqfJeieRwLUrCTF7CL4jJ66WaLSntHoZGGCpj2J7o969FAiXh3QaxFnWXp2Zod8bgt1jwl+48lElV6Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwHyxXN40DhvlTa7tuOInsfaCng0lN0aTvw2Zghd7tKHejoqvd
	YKZkURvS4DZUqGM6cbKaBq8ztSuhTtHh6lBAcCAQ8sipiASxeeuuhhu8djjy6SjimW0ukHcobXx
	7UPoMIl8TLXH13i+6mTDfDxyYM2eM4QmIpDb7At3m+Q==
X-Gm-Gg: ASbGncsk3S9exmvPG50Pu0UzR+OiVCZOz3Wgf3qRYk8pk9RR26MLZPTxWjDwNY5VR2u
	rJBPtf4ohlpjE6qQquI20qcj4hmnXcufAb6bQNlDMb1K1XSW6zDIDM0u/wAfZgnIl+14Br6VNhW
	LyB71nP3ijQYiQ/PwNNSy7EHXP3Sd/ftU=
X-Google-Smtp-Source: AGHT+IGJrpaXggbO0XyLY6WU6SWTgZC9F8s7Hf3WwPDR/lbtMX7FQqhOd0dkVj8JEzPGo+APzIftTHlFkeC/LSVLiBg=
X-Received: by 2002:a05:622a:53cb:b0:494:9e0e:2129 with SMTP id
 d75a77b69052e-49f3505f1femr51220641cf.22.1748090844750; Sat, 24 May 2025
 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 13:47:13 +0100
X-Gm-Features: AX0GCFvBeLD8sRxyqEm85OLAoQZjo4C2fe9icGhm_Cxkm7__yWuuXUFz1KdCsJ8
Message-ID: <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_054726_622070_740EF007 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jason,

On Thu, 22 May 2025 at 09:52, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
>
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
>
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.

Waiting up to 500ms for each plane to be disabled is ... not ideal.
Especially as multiple planes can be disabled at once. This may happen
dynamically during runtime, e.g. when a video is playing and a user
moves their cursor over the plane to make the UI controls visible.

I think this should be handled through the atomic_commit() handler,
with asynchronous tracking of the state, instead of the hard block
here.

Cheers,
Daniel

