Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E46CD5BDD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTWN2IzSTNHUnzzZjWVUNDOSHQiwkW3rxXNF6EJgg2w=; b=YcESsfUqBeOf/XQwzrX6UEMwsw
	RuF5BeYiE2/TjANSoaKIpUwzKxxozUMBqZbnw/Xr8/cLSpy20863LBW8KMdF0DTY6/HSjLxRnVmgj
	P+9nalsTfYRVz0NvdsbPTGniwRjZ/gbpnwMsEjwXVRNTH5ozCX55uIniFyjt+UrjMSEXhtrmE7jC1
	VZR8XJw2U9k7KoAcsoWhYCalGrR+dK3Yh0hVFGfzi4lz/4g19C9x2YvnqzWdtQ5DwTTMSUtD5aV6u
	wOJOWvXu6BOVfrRgiF5MhZVwvMvsRWKHx3jcivxniXyJN3QPWIQPzvEv1vvD+W7aelGk0J6a2NaGM
	vktXJeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qicbK-000l6r-33;
	Tue, 19 Sep 2023 15:25:22 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qicbI-000l6P-05
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 15:25:21 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-792979d4cb5so221601039f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unal.edu.co; s=google; t=1695137117; x=1695741917; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTWN2IzSTNHUnzzZjWVUNDOSHQiwkW3rxXNF6EJgg2w=;
        b=Zsv8FjsVBgGmvX+LChki8cwa1y6M9Qt20eA/VHMH/YfORV9kPt6Pcfwu8sh9WFtIpB
         9J3mU//Qz7Z/9NGcvS8X54SjuI0VeCa8BZtZPERjjB7Mz8tob1oncRlgo/ZAEytzP7BF
         kZcUrIsMdoQASB2x7QDQvRzxFe7mNNsW0BvQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695137117; x=1695741917;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTWN2IzSTNHUnzzZjWVUNDOSHQiwkW3rxXNF6EJgg2w=;
        b=Az44tadTgiuri08h6rckMhaW3VONE9ibbx+mVMrgcYVf04lMXbz5I5LpulH7DT9snw
         +KQzRhDK2bqYn3b54XnAv3VvBXcI4Fgwuo3On9Kjs+69L1XbTVG+Okrz8sBec24nInn1
         i8HYxpMsfkepTN6SSjjr84uyfKBSMmK0XdtsxCsx3JX+i9Gdr/37xMfBRhuIBUOnOeFj
         0FhxsWwCdy6EocGsGE/CNE+HWwWy6KADd7VR7W+NNobC44SlNNfbiBoHeNUTVol2uKhP
         PcBqk1mLaW1eVJAmROlTZyMVZ1rrVsCJ+7rFxPrfzAAYrlWVfRX/07z5F+p4YZs/7yGe
         qezQ==
X-Gm-Message-State: AOJu0Yyv6rSPD6HHQUe40xsLhAgvgx4XwgOt/edoHLX9YDDWHOS8hVHs
	jy9c6aX5cH9xVyc3kRjs70O+0eS+MpN089yJOKdYS7CGxw19C/f392e7CI1wfse9q+B7hCvET9d
	NXjOwzPyaLFNUGyG3fmPQNC/R7hqU4L1wkT3ZDnT/F7I3S5PHrGIdeYzP
X-Google-Smtp-Source: AGHT+IFhJhHFJunIx3ok2OTjg51iQNyJ9j6+6A4NbDnaczYDqMSFAFAAILgrEdkEfDKRN0f895fH2w+QNoSTp0UnP5M=
X-Received: by 2002:a5e:8a09:0:b0:792:82f8:7402 with SMTP id
 d9-20020a5e8a09000000b0079282f87402mr150710iok.16.1695137117188; Tue, 19 Sep
 2023 08:25:17 -0700 (PDT)
MIME-Version: 1.0
From: Julian David Jimenez Paz <jujimenezp@unal.edu.co>
Date: Tue, 19 Sep 2023 10:25:00 -0500
Message-ID: <CA+=e3O-CXLvjqpWMQNi_g8K4LTJBaMkzYU5+U9=NTZnFF3QFYQ@mail.gmail.com>
Subject: Mediatek mt7902 Linux drivers
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_082520_069302_1A082CE6 
X-CRM114-Status: UNSURE (   4.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Good afternoon everyone,

The purpose of this email is to ask you if there is any plan on
developing drivers to support the wireless chip Mediatek mt7902 on
linux OS. I have recently bought an ASUS Vivobook go 15 (E1504F) that
came with this chip. According to
https://wireless.wiki.kernel.org/en/users/drivers/mediatek there is no
support for this chip so I had to use an external USB adapter. It
would be great if support was added to this chip since this laptop is
quite popular. This laptop will be used to run simulations for
academic purposes and also meteorology and weather forecasting
simulations which is why I need to install Linux OS. Thank you.

Best regards,

Julian Jimenez-Paz
Physics undergraduate student
Department of Physics
UNIVERSIDAD NACIONAL DE COLOMBIA
Bogota, Colombia

--=20
*Aviso legal:*=C2=A0El contenido de este mensaje y los archivos adjuntos so=
n=20
confidenciales y de uso exclusivo de la Universidad Nacional de Colombia.=
=20
Se encuentran dirigidos s=C3=B3lo para el uso del destinatario al cual van=
=20
enviados. La reproducci=C3=B3n, lectura y/o copia se encuentran prohibidas =
a=20
cualquier persona diferente a este y puede ser ilegal. Si usted lo ha=20
recibido por error, inf=C3=B3rmenos y elim=C3=ADnelo de su correo. Los Dato=
s=20
Personales ser=C3=A1n tratados conforme a la Ley 1581 de 2012 y a nuestra=
=20
Pol=C3=ADtica de Datos Personales que podr=C3=A1 consultar en la p=C3=A1gin=
a web=C2=A0
www.unal.edu.co <http://www.unal.edu.co/>.*=C2=A0*Las opiniones, informacio=
nes,=20
conclusiones y cualquier otro tipo de dato contenido en este correo=20
electr=C3=B3nico, no relacionados con la actividad de la Universidad Nacion=
al de=20
Colombia, se entender=C3=A1 como personales y de ninguna manera son avalada=
s por=20
la Universidad.

