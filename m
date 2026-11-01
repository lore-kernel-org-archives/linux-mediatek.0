Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A890606A325
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ojKY5hSD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSzieVkC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=; b=ojKY5hSDjMbqhE
	M9n5IdoaxY78nJ/9bohew3lA1QRtjw2PuBVcSwag96LT96/GZq1eSNOXAgURku/NUSLgYpB4Uw3f7
	w8jRbrJfLRdCAhs5sovm4m2Ymzx+UdFI8FHUlEkOSWV+0P5+/KigJr8S0fNQ3M4EMwNSPvrTIIRQT
	/erCQJsY+xYePnNsdEtUWpDkYGJ9gyQyIoYDPGH5xhTxLSzqhVXLVs+hFfjkjjpOW/TN+lOBdosbV
	PAs/CuUG2ffG85CvIzjjtBO4K1zq0p62KQB/tWLsTPWIUEeMluFfzZTY5GhKia3w0NxIY4V3wrZXq
	HjOJJpOUAmomquQ1V/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRNO-0000000E2fW-02TZ;
	Sun, 01 Nov 2026 08:57:18 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNRNL-0000000E2ek-0Rfg
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Nov 2026 08:57:16 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-19305bcb72cso1431309c88.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 01:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793523433; cv=none;
        d=google.com; s=arc-20260327;
        b=JJ9tg6oekKbiyCa+oefRAB17D2qXF5t/SUUcACYmRag0spr5fyPGQZmDg54GsOkVud
         ojG9yYIDKRSQVQc8PBBq/hx0JnQPQdB72fv9bHuR1aq+wJUXAqsj64lknNNjl5u0MW4v
         Ec42+xJjvNgxD8SqLXiviLbK/N6g2ER7ed5SzsmBEz1JFdRkfKqMm+GipHqWp9J5GegI
         55zQcOjjfZ6gyjFvltIou5WR3nzCJkRBooaE8elZVd8MeCOT2G23B8BzXnpbzMN2+b4v
         s2Bf+vVDUJl4bAr1NCSc8Qz6AzttdYollvRW2sdQvuW4p8JbnI6SeCV2qMU7KCsgwIaY
         8izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        fh=O/KrS45Q4BM1R1nz1PPX6899mV8nDzlWNEmS2driI/Q=;
        b=V9XnmFLBJsGeeesyRGaxe4iNcdWPspllKe5t/1+5zkxYWqe+IGmQwngOihqPGEcHQx
         j/+HbkaUuADZ05tMe5FD3LohFmnnWJuLLW/KllDVf5nySuoEk0I594Mi2PX9xnjWxxEm
         oR+qZtFp78Fk5CUtGRdAXjCPL3Y7HapEUo0wCvL8cx45PG8RXO6sUftwJ6Z+z0hpjiMy
         Ue4hqIx5kR5n3OvfF6lP+jln1h0TLI3nNYils2d9TVckocKLTCoXNQ7R1TU2kozlN6qL
         W1kVJVJluVzmFpMyJVyu+ML1Jpa5i1W8yDhloTEu5BLnvbfu91pFxiU77QihZ9Zg85zn
         R8xw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523433; x=1794128233; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=WSzieVkCaMWJBw5qx8WR7WL0Nj5yuUA4Y4PZWtuOkI8CQO4UkOk1diFwcNgsObWSEN
         DHmf87ez+oW7hSfSDIAigx+8kZvp5g6t5GbfmBvjhFy5YnvPlzlHuNcpERM6GOsBNfaO
         ub90KkEvgPf2+tS5comotJr0jmBj7hICgupT/7tI7UyWzbGpmmZMp374pqD3YJ9Uiily
         o48naeC437zxKHZbxdEAsEQZM6xeUwi4v/1uA2HRsCwV/n57fZVdIz8H3CksZdZ3pwOb
         HRtpgSAn2yUqa6ESLPjb+VjN9j+f/6KCBZlfJL+wXF6Tm5tlvGFIK19maGIOY85KBWe3
         zagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523433; x=1794128233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EsnCPk4RiF2PEHjx3fU/KxMK5RivL58Fapzh0X8PUM=;
        b=AWKLGGt/lOhznk0PbZSaC2VfgN4g+QaiL8WwVo0mFA9kX5LR/kGqsLluDluwOgE4l4
         QgIHcIrPMt/56nFtaLYfXmcLcoFx2m3VFiiY50S2TNC6XSPBsU6DekZbH10m8hBpwrOQ
         K36x61u3wh6V2UBPP5+bpT01/DnwucQgcuGHtGpRlsBrnnY954zlWpdt1BQoqcyyPGKX
         arWnxHESJPwPfkipAzWND8O0tpardGHfcEJgMTbfry9H30tlKJdacNFFjIhfM8hCsC6T
         BcygR2WspVIJ2HM8BTb7ar1XAguyAVTvPecFbCVaBli2s72xx5sqQSrMD4/Rzao1DkLr
         ZotQ==
X-Forwarded-Encrypted: i=1; AKwUvByJUYPf6OlxHrXRt5T9T8IKaP0G3Ap26XFLdcdwxkgy7oUhkXLjNTPudTR6QWKoNiKz3yBHpIw1PAGQQvhPmA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLznTneabJ3Fi5pg0U99F5C5JvMrKuhbXhwQ9IH9vlVGPBlL4hW
	igB4gVD+5b63BPO+53E19mzF3X6V8HGr6pS/HK3bDnFocbQopqxsJmpQtS638SclWjr69YA8ssL
	62iDQBgIoZEr1LnL8VRSyZr3qzHUkGsY=
X-Gm-Gg: AYBFou0PLVL8z8zyeynGMpcgWkC1Au3DdDGp3euVgE7Gh52YfdOPE74k/Ln8nUAEarB
	Hv5ymhsob+rfn0z5jQCTIbCtI2gPMvW69odosKgOUsGrHAM/AnkkqyS3AuleFLZs8UX+H7wFiCu
	jgwHkRAaEaCr1wmttEITG2OsLmF8HPeyjn9rZn+8Hc/lCKi9d4lFrdWLhV5IvxkUXzzfkqfBR5K
	9dhZ1QnAuYRHpaA1xNorEolJfIWknq3n27zjR8TbCVf/HKJ1kE6LoICdv1y/zhcEU5OyXXyD43S
	+LS3li832xPNS4Yfw2xMz2QyCcusyVrMiP5i6eGj33Z+sX8lQ5+bw8MB1Z/VsaBzCd6wOKi00JO
	ziJnJf/bv8qNSBql/eDjkz91Uk7MlQWeQfQ==
X-Received: by 2002:a05:701b:240f:b0:15e:6541:3099 with SMTP id
 a92af1059eb24-1ac5a0b8b3amr9647957c88.7.1793523433136; Sun, 01 Nov 2026
 01:57:13 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
In-Reply-To: <20261101070121.2714-1-sreekuttan2156239@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 1 Nov 2026 09:57:02 +0100
X-Gm-Features: AclHuK9wgaJ_HkNnJv_xBJjiMMzCDxyfUAruQ6NGbegvoXIPxxM6IwWV1dPVkkM
Message-ID: <CAMhs-H8qmxZZ=6LD2qCJfM0AciX60AcPz3pqCp+gS5De2P-bYQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_015715_160541_D48D796E 
X-CRM114-Status: GOOD (  13.77  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 8:02=E2=80=AFAM Sreeraj S Kurup
<sreekuttan2156239@gmail.com> wrote:
>
> The PCIe port initialization code acquires a reset control handle using
> of_reset_control_get_exclusive(). However, when PHY initialization or
> power-on fails, the port is removed from the PCIe port list without
> releasing the acquired reset control handle.
>
> Since the reset control cleanup iterates over the remaining ports in
> the list, the removed port's reset control handle is never released.
>
> Call reset_control_put() before removing the failed port from the list
> to ensure that the reset control resource is properly released.
>
> Fixes a resource leak on PCIe PHY initialization failure.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

