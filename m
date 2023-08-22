Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8A4EE49A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 01:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:
	Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=; b=p2+AGdo+2PD+HtX70oqfHC37mT
	7QGE8bqIXp5DItdzTsLD+lfpwL1HTu0RDxCtMFgR6G5bRbxE8UscY/u1gRAxWDpIVRWQzHAfhfaMD
	NpmvYEZ4E3YM+qkGc/ngizYK6t7F+NGYBLZ/v7Rl6qNBm1V2KcCzlpZBUp3nPwPsCi8OaJl/NoASG
	hiwaNtHcoK6G9tqe05E0a9A0ol6nag0SryL4S9uw6YjgQfPovBPZjcLdOh3WnlgUxW6hAoA8Fk/c+
	uaQ4KXL3DR3o6cNRAhiKTS6GB1+nlvt8aSru3QzJj0CklyvSU5Cn2qHRkjaog3B4Ca8g73dxuG+cB
	e4vorhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYcbl-00H0tq-1u;
	Wed, 23 Aug 2023 01:24:29 +0000
Received: from symantec4.comsats.net.pk ([203.124.41.30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYcbi-00H0rg-0z
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 01:24:27 +0000
X-AuditID: cb7c291e-055ff70000002aeb-36-64e54ad3c2a4
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
	(using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id EF.CA.10987.3DA45E46; Wed, 23 Aug 2023 04:54:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=jMUWROgm9Z5EnwMR/bNhs70wLftW53xZY2+tlgFbR0A7EmdrCXto11svj//f1R1cQ
          dZCUHNag6o2Ty06s0H4uDNWKzKBBGZA/PtF7tpoHaVV9ep0FdyFDcOfJGpZGSpuSX
          HHqT76/LwD0cTbDBg31Q65wYiF5GVbbBTQvNyM0zo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=MZ+BQMHCvy94b+vzTTx+x+OUuZ4KOlXmntpG3EQgns4kexBFSFy57EOatrd3T0X/V
          PrXHHrVkJEk2YJwl08HhDj6xuGryaFbVhaQFtyfxsl2rHpm/ty2UnKPvU4UEEfbGS
          Xvk+JveyhfmRQ7/yqGnBAUwZ9o217BMmRhVTXMEHg=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:03 +0500
Message-ID: <EF.CA.10987.3DA45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To: linux-mediatek@lists.infradead.org
From: "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date: Tue, 22 Aug 2023 16:31:17 -0700
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW/ey19MUgzt7rSwuN19kdGD02Lyk
	PoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCR2P1iHWMXIxeHkMAe
	JolN/ZvBHBaB1cwS89qes0E4D5kl3p9uZYcoa2aUWPvvI1g/r4C1xKsj3awgNrOAnsSNqVPY
	IOKCEidnPmGBiGtLLFv4mrmLkQPIVpP42lUCEhYWEJP4NG0ZO4gtAhReMO8n2Eg2AX2JFV+b
	GUFsFgFViYOb3oONFxKQkth4ZT3bBEb+WUi2zUKybRaSbbMQti1gZFnFKFFcmZsIDLZkE73k
	/NzixJJivbzUEr2C7E2MwEA8XaMpt4Nx6aXEQ4wCHIxKPLw/1z1JEWJNLAPqOsQowcGsJMIr
	/f1hihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFeW6FnyUIC6YklqdmpqQWpRTBZJg5OqQZGH9lj
	nRYTTt1e7H1Af6ob+4/wrtchXmdeLk+9cXzVgrx9zDWxH1NVlyXOOpu8ze5r9rSpqvPzLENP
	vRG5XLKY+ZrYR+njbjtU8xR0N/iwf/0y04x5Ce/HN8y/shd7/Oqvmzh/34PEzhlRN/scnv4x
	3520tE7f77Wi4VGm126zXiybJNG5mfulqBJLcUaioRZzUXEiAGBFaApAAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_182426_619456_362EF743 
X-CRM114-Status: UNSURE (   0.17  )
X-CRM114-Notice: Please train this message.
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
Reply-To: chnyne@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


